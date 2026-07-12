#!/usr/bin/env bash

set -e
export WINEPREFIX="$(pwd)/wineprefix"

wine_run() {
	wine "$@" > wine.log 2>&1 < /dev/null &
}

DISC_PATH="$(pwd)/diablo-cdrom"
mkdir -p "${DISC_PATH}"
sudo umount -f "${DISC_PATH}" 2>/dev/null || true # Just in case (true to not abort on 'set -e')

# If something fail
trap 'sudo umount "${DISC_PATH}" 2>/dev/null || true' EXIT


echo "[+] Mounting Disc 1"

sudo mount -o loop "Diablo II Disc 1 - Install.iso" "${DISC_PATH}" 2>/dev/null
echo "[+] Running SETUP.EXE"
wine_run "${DISC_PATH}/INSTALL.EXE"
echo "> CD 1 mounted"
echo "> Select 'FULL INSTALL'"
echo "> CD-KEY: 6W8M-2R7K-F4J2-8MTX"
read -p "Press Enter when asked for the 'Play Disc'..."

echo -e "\n[+] Switching to Disc 2"
sudo umount -f "${DISC_PATH}"
sudo mount -o loop "Diablo II Disc 2 - Play.iso" "${DISC_PATH}" 2>/dev/null
echo "> CD 2 mounted"
echo "> Click 'Ok' in the Installer"
read -p "Press Enter when asked for the 'Cinematic Disc'..."

echo -e "\n[+] Switching to Disc 3"
sudo umount -f "${DISC_PATH}"
sudo mount -o loop "Diablo II Disc 3 - Cinematics.iso" "${DISC_PATH}" 2>/dev/null
echo "> CD 3 mounted"
echo "> Click 'Ok' in the Installer"
read -p "Press Enter when asked for the 'Install Disc'..."

echo -e "\n[+] Switching to Disc 1"
sudo umount -f "${DISC_PATH}"
sudo mount -o loop "Diablo II Disc 1 - Install.iso" "${DISC_PATH}" 2>/dev/null
echo "> CD 1 mounted"
echo "> Click 'Ok' in the Installer"
echo "> Cancel all the popups after the installation is completed"
read -p "Press Enter after you clicked 'Exit Installer'..."
sudo umount -f "${DISC_PATH}"
wineserver -k

# -----

echo -e "\n[+] Switching to Expansion Disc"
sudo umount -f "${DISC_PATH}" 2>/dev/null || true # Just in case (true to not abort on 'set -e')
sudo mount -o loop "Diablo 2 Lords of Destruction.iso" "${DISC_PATH}" 2>/dev/null
wine_run "${DISC_PATH}/INSTALL.EXE"
echo "> Expansion CD-KEY: 27R4-BWPZ-RCNV-FXC7"
read -p "Press Enter when asked for the 'Play Disc'..."

echo -e "\n[+] Switching to Disc 2"
sudo umount -f "${DISC_PATH}"
sudo mount -o loop "Diablo II Disc 2 - Play.iso" "${DISC_PATH}" 2>/dev/null
echo "> CD 2 mounted"
echo "> Click 'Ok' in the Installer"
read -p "Press Enter when asked for 'Expansion Disc'..."

echo -e "\n[+] Switching to Expansion Disc"
sudo umount -f "${DISC_PATH}"
sudo mount -o loop "Diablo 2 Lords of Destruction.iso" "${DISC_PATH}" 2>/dev/null
echo "> Expansion CD mounted"
echo "> Click 'Ok' in the Installer"
read -p "Press Enter after you clicked 'Exit Installer'..."
sudo umount -f "${DISC_PATH}"
wineserver -k

echo -e "\n[+] Running 'LODPatch_114d.exe'"
echo "> The game will launch after the patch"
echo "> The game is located at '${WINEPREFIX}/drive_c/Program Files/Diablo II/Diablo II.exe'"
sleep 10
wine "$(pwd)/LODPatch_114d.exe"
