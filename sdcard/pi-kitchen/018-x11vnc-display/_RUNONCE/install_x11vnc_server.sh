#!/bin/sh
RECIPE_DIR=pi-kitchen/018-x11vnc-display/
cd /home/pi/recovery/$RECIPE_DIR
#Install X11VNC Server to share desktop display
sudo dpkg -i deb/*.deb
echo "X11VNC installed"