#!/bin/sh
echo ">>>>>>>>>>>>>>"
echo "Run once script"
#Set the date as new as possible (avoid install warnings when files are newer)
sudo date -s "2014-11-11 12:00:00"
echo "IP Address" >> /home/pi/ipONCE.txt
hostname -I >> /home/pi/ipONCE.txt

#This will run all the sh files placed in the ~/bin/_RUNONCE directory
cd /home/pi/bin/_RUNONCE
list=`ls *.sh`
for script in $list
do
echo ">>> Running: $script"
sh "$script"
done

