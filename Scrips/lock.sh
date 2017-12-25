#!/bin/bash
scrot /tmp/screen.png
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
#convert /tmp/screen.png -paint 3 -modulate 80 /tmp/screen.png
#convert /tmp/screen.png -paint 1 /tmp/screen.png
[[ -f ~/.config/Scripts/lock.png ]] && convert /tmp/screen.png  ~/.config/Scripts/lock.png -gravity center -composite -matte /tmp/screen.png
#mocp -P
i3lock -u -e -i /tmp/screen.png
