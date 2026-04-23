#!/bin/bash

COLOR="\033[32m"
OUT="\033[0m"

echo -e "${COLOR}Searching...${OUT}"
sudo apt update; echo -e "${COLOR}\nList of programs upgradable:${OUT}"
apt list --upgradable; echo "" 
sudo apt upgrade 
echo -e "${COLOR}Finished!${OUT}"
