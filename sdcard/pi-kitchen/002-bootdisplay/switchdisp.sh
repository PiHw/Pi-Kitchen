#!/bin/sh

#Function to swap to HDMI Normal
hdminormal () { sudo cp /boot/display/hdminormal/config.txt /boot/config.txt;}

#Function to swap to HDMI Forced
hdmiforced () { sudo cp /boot/display/hdmiforced/config.txt /boot/config.txt;}

#Function to swap to SDTV PAL
sdtvpal () { sudo cp /boot/display/sdtvpal/config.txt /boot/config.txt;}

#Function to swap to SDTV NTSC
sdtvntsc () { sudo cp /boot/display/sdtvntsc/config.txt /boot/config.txt;}

# Menu using case-esac
echo "Select BOOT display settings? Use: HDMIDefault / HDMIForced / SD PAL / SD NTSC / Keep (d/f/p/n/k)?"
read answer
case $answer in
 d|D) echo "Use HDMIDefault";hdminormal;;
 f|F) echo "Use HDMIForced";hdmiforced;;
 p|P) echo "Use SD PAL";sdtvpal;;
 n|N) echo "Use SD NTSC";sdtvntsc;;
 *) echo "Keep - No Change";;
esac

echo config.txt
echo ____________
cat /boot/config.txt
