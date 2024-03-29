#!/bin/sh

#xrandr --output LVDS1 --mode 1366x768
#xrandr --output VGA1 --rotate left --mode 1440x900 --left-of LVDS1
#xrandr --output VGA1 --rotate normal --mode 1440x900 --right-of LVDS1

# xscreensaver
xscreensaver -no-splash &

# Desktop effect, for example transparency
#xcompmgr &

#xmodmap $HOME/.Xmodmap

# Dropbox
#dropbox start

# nm-applet
nm-applet &

#kupfer --no-splash
#20180507  老的 启动在rc.lua
#synapse -s &

#作为托盘图标启动
remmina  -i 

#kupfer  --no-splash 
#kupfer   
# trayer
#ssh -i /home/evan/.ssh/mykey/id_rsa -p 22 -qtfnN -D 7070 evan@pie.evanlinux.com
trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --widthtype pixel --width 128 --transparent true --alpha 0 --tint 0x000000 --height 18 &

# ssh-proxy
#ssh user@vps.com -ND 7070 &
#autossh -M 20000 -f -q -N -D 7070 user@vps.com

# wallpaper
#nitrogen --restore

# disable touchpad when typing
#syndaemon -td

# vim: set ft=sh:
