#!/bin/bash

LOG_battery=/usr/local/bin/battery_logs

sudo mkdir -p /usr/local/bin/battery_logs
sudo chmod 555 -R /usr/local/bin/battery_logs

function creating_log(){

echo -e "\n---------------------------$(date +%D\ \%H.%M.%S)--------------------------\n$(upower -b | grep -iE "energy-full:|capacity:")\n" >> "${LOG_battery}/log_battery$(date +%d:%m:%Y).txt"

}
creating_log
