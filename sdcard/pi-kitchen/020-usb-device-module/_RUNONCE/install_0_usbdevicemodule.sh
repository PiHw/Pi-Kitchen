#!/bin/sh
#Set the path of the PiZeroCombined file
modulesource="/home/pi/recovery/pi-kitchen/020-usb-device-module/module/PiZeroCombined.tar.gz"
modulefolder=PiZeroCombined

#Extract the module to tmp directory
tar xvzfC $modulesource /tmp/

#Copy the boot partition files to /boot
sudo cp -R /tmp/PiZeroCombined/fat32/* /boot/

#Copy the root partition module files
sudo cp -R /tmp/PiZeroCombined/ext4/lib/* /lib/

#Remove extracted files
sudo rm /tmp/$modulefolder -Rf

echo "USB Device Module Installed!"
