#!/bin/sh
echo ">>>>>>>>>>>>>>"
echo "Automatic startup script"
date >> /home/pi/recovery/ip.txt
hostname -I >> /home/pi/recovery/ip.txt
echo "\n" >> /home/pi/recovery/ip.txt

echo "Start _RUNSTART actions:"
sh /home/pi/bin/runstart.sh

echo "Start _RUNSTARTBG actions:"
sh /home/pi/bin/runstartbg.sh