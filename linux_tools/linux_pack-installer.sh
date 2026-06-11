#!/bin/bash

#RED
#BLUE
GREEN="\033[32m"
BK="\033[0m"


echo -e "${GRE}\nWelcome to the linux tools script.\n\nWhat do you want to install?\n-Bluetooth\t-Vim/NeoVim\t\t-Vlc\t\t-Tmux\n-Pavucontrol\t-Remmina\t-SSH\n-NetTools\t-Unrar\t\t-Iostat"
echo -en "\nWrite here: ${OUT}" && read -ra user_insertion && echo -e "\n"

for program in "${user_insertion[@]}"; do
case "$program" in
	*vim* | *VIM* | *Vim* | *nvim* | *neovim* | *NVIM* | *Nvim* | *NEOVIM* | *Neovim* )
		sudo dnf install -y vim neovim
		;;

	*remmina* | *Remmina* | *REMMINA* )
		sudo dnf install -y remmina
		;;

	*ssh* | *SSH* | *Ssh* )
		isudo dnf install -y ssh openssh dhclient cockpit net-tools
		sudo systemctl disable --now sshd.service && sudo systemctl enable --now sshd.socket && sudo systemctl enable --now cockpit.service
		;;

	*Pavucontrol* | *pavucontrol* | *PAVUCONTROL*)
		sudo dnf install -y pavucontrol
		;;
		
	*bluetooth* | *Bluetooth* | *BLUETOOTH*)
		echo -e "${COLOR}\nLet's activate bluetooth services.\n${OUT}"
		systemctl status bluetooth | echo -e "$(grep -im 1 "Active")\n"
		sudo systemctl restart --now bluetooth; sudo systemctl enable --now bluetooth; systemctl status bluetooth | echo -e "$(grep -im 1 "Active")\n"
		bluetoothctl discoverable on | echo -e "     Searching devices...\n${COLOR}\nUse bluetoothctl help.\n${OUT}"
		;;

	*qemu* | *Qemu* | *QEMU* | *kvm* | *Kvm* | *KVM*)
		sudo dnf install -y qemu virt-manager libvirt-daemon-kvm

		;;

	*unrar* | *Unrar* | *UNRAR*)
		sudo dnf install -y unrar		
		;;

	*iostat* | *Iostat* | *IOSTAT*)
		sudo dnf install -y iostat
		;;

	*tmux* | *Tmux* | *TMUX*)
		sudo dnf install -y tmux
		;;


		*)
		echo "Program \"${program}\" isn't listed."
esac
done
