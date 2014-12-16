#!/bin/sh

#Function to swap to Direct IP Address
direct () { sudo cp /boot/network/direct/cmdline.txt /boot/cmdline.txt;}

#Function to swap to Normal Automatic IP Address
normal () { sudo cp /boot/network/normal/cmdline.txt /boot/cmdline.txt;}

#Function to swap to Internet IP Address
internet () { sudo cp /boot/network/internet/cmdline.txt /boot/cmdline.txt;}

# Menu using case-esac
echo "Select IP Address? Use: Direct / ICS / Auto / Keep (d/i/a/k)?"
read answer
case $answer in
 d|D) echo "Use Direct IP;direct";;
 i|I) echo "Use Internet (ICS) Direct IP";internet;;
 a|A) echo "Use Auto IP (normal LAN)";normal;;
 *) echo "Keep - No Change";;
esac

echo cmdline.txt
echo ____________
cat /boot/cmdline.txt
