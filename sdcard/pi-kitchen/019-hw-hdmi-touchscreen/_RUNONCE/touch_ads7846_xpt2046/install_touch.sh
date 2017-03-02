#!/bin/sh
HOME="/home/pi"
recipe_path=$HOME"/recovery/pi-kitchen/019-hw-hdmi-touchscreen"
deb_path=$recipe_path"/deb/"
insert_sh=$HOME"/bin/insert_line.sh"


cd $deb_path
#Install Dependencies:
sudo dpkg -i xinput-calibrator*.deb

LINE="dtoverlay=ads7846,penirq=25,speed=10000,penirq_pull=2,xohms=150"
FILE="/boot/config.txt"
LOC="#019-hw-hdmi-touchscreen"
sudo sh $insert_sh $FILE "$LOC"
sudo sh $insert_sh $FILE "$LINE"

echo "Touchscreen Enabled"
