#!/bin/bash

COLOR="\033[32m"
OUT="\033[0m"

echo -e "${COLOR}Searching...${OUT}"
sudo dnf update --refresh
echo -e "${COLOR}Finished!${OUT}"
