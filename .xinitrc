hsetroot -solid "#222323" &
slstatus &
compton &
nm-applet &
xrdb "/home/nith/.Xresources" &
xbacklight -set 20 &
setxkbmap -layout gb
while true; do
  /usr/local/bin/dwm 2> /dev/null
done
