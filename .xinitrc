hsetroot -solid "#222323" &
slstatus &
compton &
mpd &
dunst &
xrdb "/home/nith/.Xresources" &
xbacklight -set 20 &
while true; do
  /usr/local/bin/dwm 2> /dev/null
done
