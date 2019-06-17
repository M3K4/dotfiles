#!/bin/bash
source ~/.config/settings.conf
export DISPLAY=:0
export XAUTHORITY=/home/a/.Xauthority
#if [ `xrandr | grep ' connected' | grep -vwE 'VIRTUAL1'| wc -l` -eq 1 ]; then
	#echo test >> /home/a/waleo
	/home/a/.config/scripts/rofimonitor.sh built-in
#fi
