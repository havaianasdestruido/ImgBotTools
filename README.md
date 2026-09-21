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
[dry-run] would UPDATE havaianasdestruido/manimce-claude (main)
[dry-run] would UPDATE havaianasdestruido/PrintSpoolerAutoRun (main)
[dry-run] would UPDATE havaianasdestruido/mmr-python (master)
[dry-run] would UPDATE havaianasdestruido/hemorroidabot (master)
[dry-run] would UPDATE havaianasdestruido/bloxNES (main)
[dry-run] would UPDATE havaianasdestruido/PatoCraft (main)
[dry-run] would UPDATE havaianasdestruido/steamlogger (main)
[dry-run] would UPDATE havaianasdestruido/blaster (main)
[dry-run] would UPDATE havaianasdestruido/gitgithub (main)
[dry-run] would UPDATE havaianasdestruido/havaianasdestruido.github.io (main)
[dry-run] would UPDATE havaianasdestruido/mmr-gui (master)
[dry-run] would UPDATE havaianasdestruido/PersonaDB (main)
[dry-run] would UPDATE havaianasdestruido/moviemaker-launcher (master)
[dry-run] would UPDATE havaianasdestruido/Giggles-Shit (main)
[dry-run] would UPDATE havaianasdestruido/pipeline-graph (master)
[dry-run] would UPDATE havaianasdestruido/OdontoAura (main)
[dry-run] would UPDATE havaianasdestruido/WindowsMovieMakerDecomp (main)
[dry-run] would UPDATE havaianasdestruido/ImgBotAutomerger (main)
[dry-run] would UPDATE havaianasdestruido/noisy (main)
[dry-run] would UPDATE havaianasdestruido/apkdecomp-skill (main)
[dry-run] would UPDATE havaianasdestruido/midi-skill (main)
[dry-run] would UPDATE havaianasdestruido/orelha (main)
[dry-run] would UPDATE havaianasdestruido/DOOMMAPS (main)
[dry-run] would UPDATE havaianasdestruido/bloxGLSL (main)
[dry-run] would UPDATE havaianasdestruido/batman (main)
[dry-run] would UPDATE havaianasdestruido/BloxFM (main)
[dry-run] would UPDATE havaianasdestruido/WebRadioFM (main)
[dry-run] would UPDATE havaianasdestruido/roblox-worthy (main)
[dry-run] would UPDATE havaianasdestruido/mediapublisher (master)
[dry-run] would UPDATE havaianasdestruido/mmr-cli (master)
[dry-run] would UPDATE havaianasdestruido/photoviewer (master)
[dry-run] would UPDATE havaianasdestruido/video-trimmer (master)
[dry-run] would UPDATE havaianasdestruido/transition-plugin (master)
[dry-run] would UPDATE havaianasdestruido/metadata-editor (master)
[dry-run] would UPDATE havaianasdestruido/slideshow-studio (master)
[dry-run] would UPDATE havaianasdestruido/movielibrary (master)
[dry-run] would UPDATE havaianasdestruido/BloodAndBacon-DnSpyEx (main)
[dry-run] would UPDATE havaianasdestruido/face-tagger (master)
[dry-run] would UPDATE havaianasdestruido/sand-box2d (main)
[dry-run] would UPDATE havaianasdestruido/AudioTaste (main)
[dry-run] would UPDATE havaianasdestruido/4window (main)
[dry-run] would UPDATE havaianasdestruido/FNF-Phoenix-Engine-fork (main)
[dry-run] would UPDATE havaianasdestruido/sigma-click (main)
[dry-run] would UPDATE havaianasdestruido/FebreMEMZ (main)
[dry-run] would UPDATE havaianasdestruido/RePlayMusic (main)
[dry-run] would UPDATE havaianasdestruido/PWSV (main)
[dry-run] would UPDATE havaianasdestruido/Nitricus (main)
[dry-run] would UPDATE havaianasdestruido/HPPD (main)
[dry-run] would UPDATE havaianasdestruido/gaslight (master)
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
OK    havaianasdestruido/mmr-python
OK    havaianasdestruido/PrintSpoolerAutoRun
OK    havaianasdestruido/RoBrowser
OK    havaianasdestruido/manimce-claude
OK    havaianasdestruido/blaster
OK    havaianasdestruido/bloxNES
OK    havaianasdestruido/gitgithub
OK    havaianasdestruido/PatoCraft
OK    havaianasdestruido/steamlogger
OK    havaianasdestruido/havaianasdestruido.github.io
OK    havaianasdestruido/OdontoAura
OK    havaianasdestruido/PersonaDB
OK    havaianasdestruido/mmr-gui
OK    havaianasdestruido/pipeline-graph
OK    havaianasdestruido/moviemaker-launcher
OK    havaianasdestruido/Giggles-Shit
OK    havaianasdestruido/WindowsMovieMakerDecomp
OK    havaianasdestruido/midi-skill
OK    havaianasdestruido/noisy
OK    havaianasdestruido/apkdecomp-skill
OK    havaianasdestruido/ImgBotAutomerger
OK    havaianasdestruido/orelha
OK    havaianasdestruido/BloxFM
OK    havaianasdestruido/bloxGLSL
OK    havaianasdestruido/DOOMMAPS
OK    havaianasdestruido/batman
OK    havaianasdestruido/WebRadioFM
OK    havaianasdestruido/roblox-worthy
OK    havaianasdestruido/mmr-cli
OK    havaianasdestruido/photoviewer
OK    havaianasdestruido/transition-plugin
OK    havaianasdestruido/mediapublisher
OK    havaianasdestruido/video-trimmer
OK    havaianasdestruido/metadata-editor
OK    havaianasdestruido/movielibrary
OK    havaianasdestruido/sand-box2d
OK    havaianasdestruido/slideshow-studio
OK    havaianasdestruido/face-tagger
OK    havaianasdestruido/AudioTaste
OK    havaianasdestruido/BloodAndBacon-DnSpyEx
OK    havaianasdestruido/4window
OK    havaianasdestruido/RePlayMusic
OK    havaianasdestruido/sigma-click
OK    havaianasdestruido/FNF-Phoenix-Engine-fork
OK    havaianasdestruido/FebreMEMZ
OK    havaianasdestruido/PWSV
OK    havaianasdestruido/Nitricus
OK    havaianasdestruido/gaslight
OK    havaianasdestruido/HPPD
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
OK    havaianasdestruido/sigma-click: schedule "daily" -> "weekly"
OK    havaianasdestruido/FNF-Phoenix-Engine-fork: schedule "daily" -> "weekly"
OK    havaianasdestruido/FebreMEMZ: schedule "daily" -> "weekly"
OK    havaianasdestruido/Nitricus: schedule "daily" -> "weekly"
OK    havaianasdestruido/PWSV: schedule "daily" -> "weekly"
OK    havaianasdestruido/BloodAndBacon-DnSpyEx: schedule "daily" -> "weekly"
OK    havaianasdestruido/RePlayMusic: schedule "daily" -> "weekly"
OK    havaianasdestruido/4window: schedule "daily" -> "weekly"
OK    havaianasdestruido/AudioTaste: schedule "daily" -> "weekly"
OK    havaianasdestruido/sand-box2d: schedule "daily" -> "weekly"
OK    havaianasdestruido/face-tagger: schedule "daily" -> "weekly"
OK    havaianasdestruido/movielibrary: schedule "daily" -> "weekly"
OK    havaianasdestruido/slideshow-studio: schedule "daily" -> "weekly"
OK    havaianasdestruido/video-trimmer: schedule "daily" -> "weekly"
OK    havaianasdestruido/metadata-editor: schedule "daily" -> "weekly"
OK    havaianasdestruido/mediapublisher: schedule "daily" -> "weekly"
OK    havaianasdestruido/transition-plugin: schedule "daily" -> "weekly"
OK    havaianasdestruido/mmr-cli: schedule "daily" -> "weekly"
OK    havaianasdestruido/photoviewer: schedule "daily" -> "weekly"
OK    havaianasdestruido/roblox-worthy: schedule "daily" -> "weekly"
OK    havaianasdestruido/DOOMMAPS: schedule "daily" -> "weekly"
OK    havaianasdestruido/batman: schedule "daily" -> "weekly"
OK    havaianasdestruido/WebRadioFM: schedule "daily" -> "weekly"
OK    havaianasdestruido/BloxFM: schedule "daily" -> "weekly"
OK    havaianasdestruido/bloxGLSL: schedule "daily" -> "weekly"
OK    havaianasdestruido/midi-skill: schedule "daily" -> "weekly"
OK    havaianasdestruido/apkdecomp-skill: schedule "daily" -> "weekly"
OK    havaianasdestruido/ImgBotAutomerger: schedule "daily" -> "weekly"
OK    havaianasdestruido/orelha: schedule "daily" -> "weekly"
OK    havaianasdestruido/WindowsMovieMakerDecomp: schedule "daily" -> "weekly"
OK    havaianasdestruido/PersonaDB: schedule "daily" -> "weekly"
OK    havaianasdestruido/moviemaker-launcher: schedule "daily" -> "weekly"
OK    havaianasdestruido/noisy: schedule "daily" -> "weekly"
OK    havaianasdestruido/pipeline-graph: schedule "daily" -> "weekly"
OK    havaianasdestruido/OdontoAura: schedule "daily" -> "weekly"
OK    havaianasdestruido/mmr-gui: schedule "daily" -> "weekly"
OK    havaianasdestruido/blaster: schedule "daily" -> "weekly"
OK    havaianasdestruido/havaianasdestruido.github.io: schedule "daily" -> "weekly"
OK    havaianasdestruido/PatoCraft: schedule "daily" -> "weekly"
OK    havaianasdestruido/steamlogger: schedule "daily" -> "weekly"
OK    havaianasdestruido/gitgithub: schedule "daily" -> "weekly"
OK    havaianasdestruido/bloxNES: schedule "daily" -> "weekly"
OK    havaianasdestruido/EZInfiniteYTLive: schedule "daily" -> "weekly"
OK    havaianasdestruido/RoBrowser: schedule "daily" -> "weekly"
OK    havaianasdestruido/manimce-claude: schedule "daily" -> "weekly"
OK    havaianasdestruido/mmr-python: schedule "daily" -> "weekly"
OK    havaianasdestruido/PrintSpoolerAutoRun: schedule "daily" -> "weekly"
OK    havaianasdestruido/.github: schedule "daily" -> "weekly"
OK    havaianasdestruido/pong-pop: schedule "daily" -> "weekly"
OK    havaianasdestruido/Hiphenatus: schedule "daily" -> "weekly"
Done.
~ $
```