#!/bin/bash

COLOR="\033[32m"
OUT="\033[0m"

echo -e "${COLOR}Searching...${OUT}"
sudo dnf update -y --refresh
sudo dnf autoremove -y
echo -e "${COLOR}Finished!${OUT}"
