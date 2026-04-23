#!/bin/bash

COLOR="\033[32m"
OUT="\033[0m"

echo -e "${COLOR}\nLet's install all vulkan drivers and tools avaliable.${OUT}"
sudo apt install  mesa-vulkan-drivers mesa-va-drivers mesa-vdpau-drivers vulkan-tools vulkan-validationlayers  libvulkan1 linux-firmware

echo -e "${COLOR}\nNow let's see your radeon card name, and platform and render a 3D cube.${OUT}"
vkcube --c 400 --width 420 --height 420
echo -e "${COLOR}"
lspci -k 2>&1| grep -im 1 'RADEON'
