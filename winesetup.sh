#!/usr/bin/env bash

set -e
export WINEPREFIX="$(pwd)/wineprefix"

echo "[+] Installing dependencies..."
winetricks -q arial corefonts dxvk d3dx9 videomemorysize=2048

echo "[+] Creating Wine prefix..."
wineboot -u

echo "[+] Killing wine..."
wineserver -k


