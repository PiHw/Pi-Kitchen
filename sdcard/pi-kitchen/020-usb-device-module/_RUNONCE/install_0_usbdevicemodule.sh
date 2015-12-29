#!/bin/sh
#Set the path of the gadgetmodulekernel file
modulesource="/home/pi/recovery/pi-kitchen/020-usb-device-module/module/gadgetmodulekernel.tgz"

#Extract the module to home directory
cd /home/pi
tar -xvzf $modulesource

#Copy the kernel.img to /boot
sudo mv /boot/kernel.img /boot/kernelbackup.img
sudo mv tmp/boot/kernel.img /boot

#Copy Overlays and Modules
sudo mv tmp/boot/overlays/* /boot/overlays
sudo mv tmp/boot/*dtb /boot
sudo cp -R tmp/boot/modules/lib/* /lib

#Remove extracted files
sudo rm tmp -Rf

echo "USB Device Module Installed!"