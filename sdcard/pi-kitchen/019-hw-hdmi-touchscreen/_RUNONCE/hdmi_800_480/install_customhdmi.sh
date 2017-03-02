#!/bin/sh

HOME="/home/pi"
insert_sh=$HOME"/bin/insert_line.sh"
#HDMI screen 800x400 needs the following setup added to /boot/config.txt
#hdmi_cvt=<width> <height> <framerate> <aspect> <margins> <interlace> <rb>
#width        width in pixels
#height       height in pixels
#framerate    framerate in Hz
#aspect       aspect ratio 1=4:3, 2=14:9, 3=16:9, 4=5:4, 5=16:10, 6=15:9
#margins      0=margins disabled, 1=margins enabled
#interlace    0=progressive, 1=interlaced
#rb           0=normal, 1=reduced blanking
LOC="#019-hw-HDMI-touchscreen"
LINE00="#HDMI 800x400 Screen setup"
LINE01="hdmi_group=2"
LINE02="hdmi_mode=1"
LINE03="hdmi_mode=87"
LINE04="hdmi_cvt=800 480 60 6 0 0 0"
LINE05="max_usb_current=1"
LINE06="#019-hw-hdmi-touchscreen END"

FILE="/boot/config.txt"


echo Add "$LOC" to $FILE
sh $insert_sh $FILE "$LOC"
echo Add "$LINE00" to $FILE
sh $insert_sh $FILE "$LINE00"
echo Add "$LINE01" to $FILE
sh $insert_sh $FILE "$LINE01"
echo Add "$LINE02" to $FILE
sh $insert_sh $FILE "$LINE02"
echo Add "$LINE03" to $FILE
sh $insert_sh $FILE "$LINE03"
echo Add "$LINE04" to $FILE
sh $insert_sh $FILE "$LINE04"
echo Add "$LINE05" to $FILE
sh $insert_sh $FILE "$LINE05"
echo Add "$LINE06" to $FILE
sh $insert_sh $FILE "$LINE06"

echo "HDMI 800x400 Screen setup ready"
