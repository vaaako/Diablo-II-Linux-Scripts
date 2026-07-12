#!/usr/bin/env bash

set -e

export WINEPREFIX="$(pwd)/wineprefix"

DISC_PATH="$(pwd)/diablo-cdrom"
mkdir -p "${DISC_PATH}"
sudo umount -f "${DISC_PATH}" 2>/dev/null || true # Just in case (true to not abort on 'set -e')

sudo mount -o loop "Diablo 2 Lords of Destruction.iso" "${DISC_PATH}"
wine "${WINEPREFIX}/drive_c/Program Files/Diablo II/Game.exe" -3dfx
sudo umount -f "${DISC_PATH}"
