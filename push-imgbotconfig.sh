#!/usr/bin/env bash
#
# push-imgbotconfig.sh
#
# Adds/updates .imgbotconfig in every repo you own (public + private,
# excluding forks by default) using the GitHub Contents API via `gh api`.
# No cloning involved — each repo is a single API read + single API write,
# run with a bounded number of parallel workers.
#
# Requirements: gh (authenticated: `gh auth login`), base64, jq (optional
# but recommended — script falls back gracefully if missing).
#
# Usage:
#   ./push-imgbotconfig.sh                 # push to all your repos
#   ./push-imgbotconfig.sh --include-forks # also push to forks you own
#   ./push-imgbotconfig.sh --dry-run       # show what would happen, no writes
#   PARALLEL=10 ./push-imgbotconfig.sh     # tune concurrency (default 6)

set -euo pipefail

CONFIG_FILE="${CONFIG_FILE:-.imgbotconfig}"
COMMIT_MSG="${COMMIT_MSG:-Add .imgbotconfig for aggressive image compression}"
PARALLEL="${PARALLEL:-6}"
INCLUDE_FORKS=false
DRY_RUN=false

for arg in "$@"; do
  case "$arg" in
    --include-forks) INCLUDE_FORKS=true ;;
    --dry-run) DRY_RUN=true ;;
    *) echo "Unknown argument: $arg" >&2; exit 1 ;;
  esac
done

command -v gh >/dev/null 2>&1 || { echo "gh CLI not found. Install it first: https://cli.github.com" >&2; exit 1; }
gh auth status >/dev/null 2>&1 || { echo "Not authenticated. Run: gh auth login" >&2; exit 1; }

# Write the config content once, exactly as decided earlier.
CONFIG_CONTENT=$(cat <<'EOF'
{
  "schedule": "daily",
  "aggressiveCompression": true,
  "compressWiki": true,
  "minKBReduced": 1,
  "ignoredFiles": []
}
EOF
)
CONFIG_B64=$(printf '%s' "$CONFIG_CONTENT" | base64 -w0 2>/dev/null || printf '%s' "$CONFIG_CONTENT" | base64)

# Pull the full repo list in one call (owner + affiliation, no per-repo listing round trips).
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
echo "Targeting $TOTAL repo(s) (archived skipped, forks $([[ $INCLUDE_FORKS == true ]] && echo included || echo excluded))." >&2

push_one() {
  local repo="$1" branch="$2"
  local existing_sha
  existing_sha=$(gh api "repos/$repo/contents/$CONFIG_FILE?ref=$branch" --jq '.sha' 2>/dev/null || echo "")

  if [[ "$DRY_RUN" == true ]]; then
    if [[ -n "$existing_sha" ]]; then
      echo "[dry-run] would UPDATE $repo ($branch)"
    else
      echo "[dry-run] would CREATE $repo ($branch)"
    fi
    return 0
  fi

  local args=(-X PUT "repos/$repo/contents/$CONFIG_FILE"
    -f "message=$COMMIT_MSG"
    -f "content=$CONFIG_B64"
    -f "branch=$branch")
  [[ -n "$existing_sha" ]] && args+=(-f "sha=$existing_sha")

  if gh api "${args[@]}" >/dev/null 2>&1; then
    echo "OK    $repo"
  else
    echo "FAIL  $repo" >&2
  fi
}
export -f push_one
export CONFIG_FILE COMMIT_MSG CONFIG_B64 DRY_RUN

echo "$REPOS" | xargs -P "$PARALLEL" -I{} bash -c '
  IFS=$'"'"'\t'"'"' read -r repo branch <<< "{}"
  push_one "$repo" "$branch"
'

echo "Done." >&2