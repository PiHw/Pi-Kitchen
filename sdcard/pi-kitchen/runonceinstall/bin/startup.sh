#!/bin/sh
echo "Automatic startup script"
sudo date >> /home/pi/recovery/ip.txt
hostname -I >> /home/pi/recovery/ip.txt

echo "Start _RUNONCE actions:"
sh /home/pi/bin/runonce.sh

echo "Start _RUNSTART actions:"
sh /home/pi/bin/runstart.sh

echo "Start _RUNSTARTBG actions:"
sh /home/pi/bin/runstartbg.sh
