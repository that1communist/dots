#!/usr/bin/env bash

# fetch the colors
source "/usr/scripts/colors.sh"

# vars
cil="/tmp/calendar.png"
bg="/usr/scripts/popup/img/bg.png"
width=$(xdotool "getdisplaygeometry" | awk '{print $1;}')
height=$(xdotool "getdisplaygeometry" | awk '{print $2;}')
ypos=$(expr "$height" - "242")
xpos=$(expr "$width")

# convert the output to png
convert -background "rgba(0,0,0,0)" \
		-fill "white" \
		-font "kakwafont-12-n" \
		+antialias \
		-pointsize 12 \
		label:"$(date "+%d %B %Y\n" && cal | tail -n7)" \
		"$cil"

# display it
sleep ".1s"
popup.sh "img" "$bg" "$(expr "$width" - "214")" -p "$(expr "$width" - "76")" &
sleep ".05s"
n30f -t "popup" -x "$(expr "$width" - "170")" -y "$(expr "$ypos" + "52")" -c "killall n30f" "$cil"

# delete it
sleep ".2s"
rm "$cil"