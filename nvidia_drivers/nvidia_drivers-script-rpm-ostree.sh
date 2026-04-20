#!/bin/bash

COLOR="\033[32m"
NC="\033[0m"

echo -e "${COLOR}\nFirstly, let's install RPMfusion, which is an important directory for Fedora, for those who don't want to do a lot of manual work.\nIt is reviewed and worked on by some devs who officially code Fedora.\n${NC}"
sudo rpm-ostree install \
https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
echo -e "${COLOR}\nNow, we'll install Nvidia Akmod, it's official, and Nvidia Cuda and Vulkan tools.\n${NC}"
sudo rpm-ostree install akmod-nvidia xorg-x11-drv-nvidia-cuda vulkan-loader vulkan-tools --allow-inactive

Nvidiainformation=$(modinfo -F version nvidia)
ptyxis --tab -- bash -c 'echo -ne "\033]0;NVIDIA GeForce Driver: '${Nvidiainformation}'\007"; watch -n 1 nvidia-smi'
echo -e "${COLOR}Vulkan drivers version...${NC}"; vulkaninfo 2>&1| grep -iEm  2 'GPU ID = 0|VULKAN INSTANCE VERSION' | grep -v WARNING
echo -e "${COLOR}\nReboot your PC after 30 minutes, cause after the installation, the drivers will start the compilation process.${NC}"
 
