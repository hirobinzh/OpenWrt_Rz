#!/bin/bash

sed -i 's/DEFAULT_PACKAGES +=/DEFAULT_PACKAGES += fdisk lsblk kmod-usb-net-asix-ax88179 kmod-usb-net-rtl8152-vendor/' target/linux/bcm27xx/Makefile

sed -i 's/ factory.img.gz / /' target/linux/bcm27xx/image/Makefile

SHELL_FOLDER=$(dirname $(readlink -f "$0"))
bash $SHELL_FOLDER/../common/kernel_5.15.sh

mkdir -p files/lib/firmware/brcm
wget -P files/lib/firmware/brcm/ https://github.com/RPi-Distro/firmware-nonfree/raw/bullseye/debian/config/brcm80211/brcm/brcmfmac43436-sdio.bin
wget -P files/lib/firmware/brcm/ https://github.com/RPi-Distro/firmware-nonfree/raw/bullseye/debian/config/brcm80211/brcm/brcmfmac43436-sdio.txt
wget -P files/lib/firmware/brcm/ https://github.com/RPi-Distro/firmware-nonfree/raw/bullseye/debian/config/brcm80211/brcm/brcmfmac43436s-sdio.bin
wget -P files/lib/firmware/brcm/ https://github.com/RPi-Distro/firmware-nonfree/raw/bullseye/debian/config/brcm80211/brcm/brcmfmac43436s-sdio.txt
