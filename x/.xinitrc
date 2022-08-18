picom --config /home/blaidd/.config/picom/picom.conf &
hsetroot -solid gray &
nm-applet &
slstatus &
setxkbmap -layout gb
export ENV=$HOME/.kshrc
xrdb -merge ~/.Xresources
while true; do 
	/usr/local/bin/dwm 2> /dev/null
done
