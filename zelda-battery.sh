#!/bin/bash

# Get system information
battery="$(pmset -g ps | awk 'NR==2' | perl -pe 's/.*?(\d+)%.*/\1/')"
discharging="$(pmset -g ps | grep dis)"

# Configuration
oncolor="01"
offcolor="11"
onheart="♡ "
offheart="♡ "
chargingcolor="03"

# Set color depending on charging status
if [[ -z $discharging ]]; then
    oncolor=$chargingcolor
fi

# Set up variables
heartcount=$((battery / 10))
i=0

# Output lightning if charging
if [[ -z $discharging ]]; then
    echo -n " ⚡  "
fi

# On hearts
echo -n "#[fg=colour$oncolor]"
if [[ $heartcount -eq 0 ]]; then
    echo -n "#[blink]${onheart}#[noblink]"
    i=1
fi
while [ $i -lt $heartcount ]; do
    echo -n "${onheart}"
    i=$((i + 1))
done

# Off hearts
echo -n "#[fg=colour$offcolor]"
while [ $i -lt 10 ]; do
    echo -n "${offheart}"
    i=$((i + 1))
done

# Output the battery percentage
echo -n "#[fg=colour$oncolor]"
echo -n " ${battery}%"
