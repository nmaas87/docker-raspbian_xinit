#!/bin/bash
# Remove tmp.lock
rm /tmp/.X0-lock &>/dev/null || true

# Disable DPMS / Screen blanking
xset -dpms
xset s off
xset s noblank

mkdir /root/.config
sudo matchbox-window-manager -use_cursor yes -use_titlebar no &
#sudo matchbox-window-manager -use_cursor no -use_titlebar no &
#npm start
gedit
sleep 2s
