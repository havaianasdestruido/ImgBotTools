# ImgBotTools
Shell scripts for using with interacting with ImgBot

## Usage

```
~ $ ./push-imgbotconfig.sh --dry-run
Fetching repo list...
Targeting 57 repo(s) (archived skipped, forks excluded).
[dry-run] would UPDATE havaianasdestruido/top100 (main)
[dry-run] would UPDATE havaianasdestruido/BulkStarHistoryAdd (main)                                       [dry-run] would UPDATE havaianasdestruido/.github (main)
[dry-run] would UPDATE havaianasdestruido/pong-pop (main)
[dry-run] would UPDATE havaianasdestruido/sitemapping (main)
[dry-run] would UPDATE havaianasdestruido/Hiphenatus (main)
[dry-run] would UPDATE havaianasdestruido/RoBrowser (main)
[dry-run] would UPDATE havaianasdestruido/EZInfiniteYTLive (main)
[ ... ]
Done.
~ $ PARALLEL=10
~ $ PARALLEL=14
~ $ ./push-imgbotconfig.sh
Fetching repo list...
Targeting 57 repo(s) (archived skipped, forks excluded).
OK    havaianasdestruido/top100
OK    havaianasdestruido/Hiphenatus
OK    havaianasdestruido/.github
OK    havaianasdestruido/sitemapping
OK    havaianasdestruido/BulkStarHistoryAdd
OK    havaianasdestruido/pong-pop
OK    havaianasdestruido/hemorroidabot
OK    havaianasdestruido/EZInfiniteYTLive
[ ... ]
Done.
~ $ nano set-imgbotconfig-schedule.sh
~ $ chmod +x set-imgbotconfig-schedule.sh
./set-imgbotconfig-schedule.sh weekly
Fetching repo list...
Checking 57 repo(s) for .imgbotconfig, setting schedule="weekly"...
OK    havaianasdestruido/Giggles-Shit: schedule "daily" -> "weekly"
OK    havaianasdestruido/HPPD: schedule "daily" -> "weekly"
OK    havaianasdestruido/top100: schedule "daily" -> "weekly"
OK    havaianasdestruido/hemorroidabot: schedule "daily" -> "weekly"
OK    havaianasdestruido/sitemapping: schedule "daily" -> "weekly"
OK    havaianasdestruido/BulkStarHistoryAdd: schedule "daily" -> "weekly"
OK    havaianasdestruido/gaslight: schedule "daily" -> "weekly"
[ ... ]
Done.
~ $
```