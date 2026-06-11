#!/bin/bash

STATUS=~/battery_log.txt
chmod 750 ${STATUS}
confirm=("y" "s" "S" "Y" "yes" "YES" "Yes")
verify=false

echo ""
read -rp "Do you want to see advanced settings? (y/n): " user

for confirm in "${confirm[@]}"; do
if [[ $user == $confirm ]];
then
	verify=true
	break
fi; done

if [[ $verify == true ]];
then
	echo -e "\nAdvanced Settings:"; upower -b | grep -iE  'model:|updated:|state:|warning-level:|energy:|energy-full|voltage-min|voltage:|percentage:|capacity:|technology:|capacity-level:|energy-rate: ' && echo ""

else
	echo -e "\nBasic Settings:"
	upower -b | grep -iE 'updated:|battery:|state:|warning-level:|energy:|voltage:|percentage:|capacity: ' && echo ""
fi

echo -e "\n---------------------------$(date +%D\ \%H:%M:%S)--------------------------\n" >> ${STATUS}
upower -b | grep -iE "energy-full:|capacity:" >> ${STATUS}
cat ${STATUS}
