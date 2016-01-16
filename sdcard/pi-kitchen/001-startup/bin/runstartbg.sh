#!/bin/sh
#Generate logfile for the last runstart executed.
logfile=/home/pi/bin/_RUNSTARTBG/runstartbg.log
echo ">>>>>>>>>>>>>>"
echo ">>>>>>>>>>>>>>" > $logfile
echo "Run runoncebg script"
echo "Run runoncebg script" >> $logfile
date >> $logfile

#This will run all the sh files placed in the ~/bin/_RUNSTARTBG directory
cd /home/pi/bin/_RUNSTARTBG
list=`ls *.sh`
for script in $list
do
echo ">>> Running: $script"
echo ">>> Running: $script" >> $logfile
date >> $logfile
sh "$script" &
done

#This will run all the sh files placed in the ~/recovery/_USER/_RUNSTARTBG directory
cd /home/pi/recovery/_USER/_RUNSTARTBG
list=`ls *.sh`
for script in $list
do
echo ">>> Running User: $script"
echo ">>> Running User: $script" >> $logfile
date >> $logfile
sh "$script" &
done

#Finish logfile
echo "Run runstartbg script Done" >> $logfile
date >> $logfile
echo ">>>>>>>>>>>>>>" >> $logfile
