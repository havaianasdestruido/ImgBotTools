#!/usr/bin/env bash
#
# set-imgbotconfig-schedule.sh
#
# Patches the "schedule" field of .imgbotconfig across all repos you own,
# leaving every other field untouched. Uses the GitHub Contents API via
# `gh api` (read existing file -> patch with jq -> write back), no cloning.
#
# ImgBot only recognizes: daily | weekly | monthly
# (there's no per-weekday, cron, or custom-interval option in ImgBot itself)
#
# Requirements: gh (authenticated), jq, base64.
#
# Usage:
#   ./set-imgbotconfig-schedule.sh weekly
#   ./set-imgbotconfig-schedule.sh monthly --dry-run
#   ./set-imgbotconfig-schedule.sh weekly --include-forks
#   PARALLEL=10 ./set-imgbotconfig-schedule.sh weekly

set -euo pipefail

CONFIG_FILE="${CONFIG_FILE:-.imgbotconfig}"
PARALLEL="${PARALLEL:-6}"
INCLUDE_FORKS=false
DRY_RUN=false
SCHEDULE=""

for arg in "$@"; do
  case "$arg" in
    --include-forks) INCLUDE_FORKS=true ;;
    --dry-run) DRY_RUN=true ;;
    daily|weekly|monthly) SCHEDULE="$arg" ;;
    *)
      echo "Unrecognized value: '$arg'" >&2
      echo "ImgBot only supports: daily | weekly | monthly (no other schedule values exist)." >&2
      exit 1
      ;;
  esac
done

[[ -n "$SCHEDULE" ]] || { echo "Usage: $0 <daily|weekly|monthly> [--dry-run] [--include-forks]" >&2; exit 1; }

command -v gh >/dev/null 2>&1 || { echo "gh CLI not found. Install it first: https://cli.github.com" >&2; exit 1; }
command -v jq >/dev/null 2>&1 || { echo "jq not found. Install it: pkg install jq  (or apt/brew install jq)" >&2; exit 1; }
gh auth status >/dev/null 2>&1 || { echo "Not authenticated. Run: gh auth login" >&2; exit 1; }

COMMIT_MSG="${COMMIT_MSG:-Set imgbot schedule to $SCHEDULE}"

echo "Fetching repo list..." >&2
REPO_JSON=$(gh repo list --limit 1000 --json nameWithOwner,defaultBranchRef,isFork,isArchived)

if [[ "$INCLUDE_FORKS" == true ]]; then
  FORK_FILTER='true'
else
  FORK_FILTER='(.isFork | not)'
fi

REPOS=$(echo "$REPO_JSON" | jq -r '
  .[] | select((.isArchived | not) and '"$FORK_FILTER"') |
  "\(.nameWithOwner)\t\(.defaultBranchRef.name // "main")"
')

TOTAL=$(echo "$REPOS" | grep -c . || true)
echo "Checking $TOTAL repo(s) for $CONFIG_FILE, setting schedule=\"$SCHEDULE\"..." >&2

patch_one() {
  local repo="$1" branch="$2"
  local api_resp existing_sha existing_content new_content new_b64

  api_resp=$(gh api "repos/$repo/contents/$CONFIG_FILE?ref=$branch" 2>/dev/null || echo "")
  if [[ -z "$api_resp" ]]; then
    echo "SKIP  $repo (no $CONFIG_FILE found)"
    return 0
  fi

  existing_sha=$(echo "$api_resp" | jq -r '.sha')
  existing_content=$(echo "$api_resp" | jq -r '.content' | base64 -d 2>/dev/null || echo "")

  if [[ -z "$existing_content" ]] || ! echo "$existing_content" | jq empty >/dev/null 2>&1; then
    echo "FAIL  $repo (existing $CONFIG_FILE is not valid JSON, skipped to avoid clobbering)" >&2
    return 0
  fi

  local current_schedule
  current_schedule=$(echo "$existing_content" | jq -r '.schedule // empty')
  if [[ "$current_schedule" == "$SCHEDULE" ]]; then
    echo "SAME  $repo (already \"$SCHEDULE\")"
    return 0
  fi

  new_content=$(echo "$existing_content" | jq --arg s "$SCHEDULE" '.schedule = $s')

  if [[ "$DRY_RUN" == true ]]; then
    echo "[dry-run] would UPDATE $repo: schedule \"${current_schedule:-<unset>}\" -> \"$SCHEDULE\""
    return 0
  fi

  new_b64=$(printf '%s' "$new_content" | base64 -w0 2>/dev/null || printf '%s' "$new_content" | base64)

  if gh api -X PUT "repos/$repo/contents/$CONFIG_FILE" \
      -f "message=$COMMIT_MSG" \
      -f "content=$new_b64" \
      -f "sha=$existing_sha" \
      -f "branch=$branch" >/dev/null 2>&1; then
    echo "OK    $repo: schedule \"${current_schedule:-<unset>}\" -> \"$SCHEDULE\""
  else
    echo "FAIL  $repo" >&2
  fi
}
export -f patch_one
export CONFIG_FILE COMMIT_MSG SCHEDULE DRY_RUN

echo "$REPOS" | xargs -P "$PARALLEL" -I{} bash -c '
  IFS=$'"'"'\t'"'"' read -r repo branch <<< "{}"
  patch_one "$repo" "$branch"
'

echo "Done." >&2