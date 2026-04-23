#!/bin/bash


COLOR="\033[32m"
OUT="\033[0m"

echo -e "${COLOR}Searching...${OUT}"
rpm-ostree update --check
echo -e "${COLOR}Finished!${OUT}"
