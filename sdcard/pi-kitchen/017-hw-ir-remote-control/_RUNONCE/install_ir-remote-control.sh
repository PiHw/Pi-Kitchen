#!/bin/sh
HOME="/home/pi"
recipe_path=$HOME"/recovery/pi-kitchen/017-hw-ir-remote-control"
deb_path=$recipe_path"/deb/"
config_path="etc/lirc"

cd $deb_path
#Install Dependencies:
sudo dpkg -i libftdi*.deb
sudo dpkg -i liblircclient*.deb
sudo dpkg -i lirc*.deb
#Copy over lirc config files (avoids prompt asking about replacing existing fil$
cd $recipe_path
sudo cp -R $config_path/* /$config_path/.
#Insert the lirc dtoverlay command into the config.txt file
# This can be added as default, if we disable it by moving
# /boot/overlays/lirc-rpi-overlay.dtb to /boot/overlays/disabled
#Enable lirc module with BCM GPIO 24 as IR input (Pin16)
echo dtoverlay=lirc-rpi,gpio_in_pin=24 >> /boot/config.txt
#Restart lirc (although this will not be enabled at this stage)
sudo /etc/init.d/lirc stop
#sudo lircd --nodaemon --device /dev/lirc0 --driver default
sudo /etc/init.d/lirc start
echo "IR Remote Control Enabled"
