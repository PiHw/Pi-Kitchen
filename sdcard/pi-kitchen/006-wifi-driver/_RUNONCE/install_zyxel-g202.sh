#!/bin/sh
HOME="/home/pi"
sudo dpkg -i $HOME"/recovery/pi-kitchen/005-wifi/zyxtel-g202/zd1211-firmware_2.21.0.0-1_all.deb"
sudo ifdown wlan0
sudo ifup wlan0
echo "ZyXel G202 Wifi Adaptor Enabled"
