# Installation scripts for Diablo II

Expected Files:
- `Diablo II Disc 1 - Install.iso`
- `Diablo II Disc 2 - Play.iso`
- `Diablo II Disc 3 - Cinematics.iso`
- `Diablo 2 Lords of Destruction.iso`
- [`LODPatch_114d.exe`](https://www.moddb.com/games/diablo-2-lod/downloads/diablo-ii-lord-of-destruction-v114d-patch)
- [`glide3x.dll`](https://github.com/bolrog/d2dx/releases) (Widescreen mod)S
	+ `d2dx.cfg` (should be included in this repository)

First run `winesetup.sh` to set up the wine environment in the current directory. Run `install-diablo2.sh` to install the main game, the expansion and patch to `1.14d` version. Run `run-diablo2.sh` to open the game

If you don't want to install the expansion, simply jump this installation step and run `WINEPREFIX="$(pwd)/wineprefix" LODPatch_114d.exe` from the root directory

