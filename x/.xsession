#Lang
export LANG=en_GB.UTF-8
#shell config
export ENV=$HOME/.kshrc
#backlight 
xbacklight -set 50
#system beep off
xset b off
# xsetroot -solid "#0d0d0d"
#Wallpaper colour
xsetroot -solid "#83988E"
#statusbar
slstatus &
#key binds
sxhkd &
#wm
exec dwm
