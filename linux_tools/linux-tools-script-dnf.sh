#!/bin/bash

COLOR="\033[32m"
OUT="\033[0m"

echo -e "${COLOR}\nLet's install some programs, that's very important for diary usage. The programs are: GoogleChrome, Vlc, Vim, Remmina, Copyq, Pavucontrol, Solaar, FastFetch, NetTools, SSH, Tmux.\n${OUT}"
sudo dnf install vim vlc remmina copyq pavucontrol solaar google-chrome-stable fastfetch net-tools ssh tmux
sudo systemctl enable --now sshd

echo -e "${COLOR}\nNow let's install VLC codecs, for maximum video compatibility, it's normal if this command replace some codecs that would be installed.\n${OUT}"
sudo dnf install ffmpeg ffmpeg-libs --allowerasing

echo -e "${COLOR}\nLet's activate bluetooth services.\n${OUT}"
systemctl status bluetooth | grep -im 1 "Active"
sudo systemctl enable --now bluetooth; systemctl status bluetooth | grep -m 1 "Activate"
bluetoothctl discoverable on | echo -e "     Searching devices...\n${COLOR}\nUse bluetoothctl help.\n${OUT}"

fastfetch
echo -e "${COLOR}\n\nREMEMBER: to remove any program use 'sudo dnf remove example'.\n${OUT}"
