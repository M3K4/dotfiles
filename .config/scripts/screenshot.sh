#!/bin/bash
source ~/.config/settings.conf
savename=img_`date "+%Y_%m_%d_%H_%M_%S"`.png
image=$SCREENSHOTS/$savename
case $1 in
	fullscreen)
		maim $image
		notify-send "Print Screen" "Fullscreen image saved\n$savename"
	;;
	window)
		maim -i `xwininfo -int | sed -nre "s/^xwininfo: Window id: ([0-9][0-9]*) .*$/\1/p"` $image
		notify-send "Print Screen" "Window image saved\n$savename"	
	;;
	selection)
		maim -s $image
		notify-send "Print Screen" "Selection saved\n$savename"
	;;
	*)
	echo "Usage: $0 {fullscreen|window|selection}"
	;;
esac
