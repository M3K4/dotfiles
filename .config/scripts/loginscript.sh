#!/bin/bash
source ~/.config/settings.conf
#the order of pywal and xrdb matters
setxrdb
setwal
~/.config/scripts/wal-set.sh
setlockscreen
st -n dropdown &> /dev/null &
st -n pulsemixer -e ~/.config/scripts/pulsemixer.sh &> /dev/null &
nonipple
