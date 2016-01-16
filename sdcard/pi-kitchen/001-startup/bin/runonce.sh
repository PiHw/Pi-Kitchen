#!/bin/sh
logfile=/home/pi/bin/_RUNONCE/runonce.log

echo ">>>>>>>>>>>>>>"
echo ">>>>>>>>>>>>>>" > $logfile
echo "Run once script"
echo "Run once script" >> $logfile
#Set the date as new as possible (avoid install warnings when files are newer)
sudo date -s "2016-01-11 12:00:00"
echo "IP Address" >> /home/pi/ipONCE.txt
hostname -I >> /home/pi/ipONCE.txt

#This will run all the sh files placed in the ~/bin/_RUNONCE directory
cd /home/pi/bin/_RUNONCE
list=`ls *.sh`
for script in $list
do
echo ">>> Running: $script"
#Log the date and time - will provide indication of installation duration
date >> $logfile
#Capture the output of the script in the logfile since this should not require any user interaction.
echo ">>> Running: $script" >> $logfile
sh "$script" >> $logfile
done

#Finish logfile
echo "Run once script Done" >> $logfile
date >> $logfile
echo ">>>>>>>>>>>>>>" >> $logfile


