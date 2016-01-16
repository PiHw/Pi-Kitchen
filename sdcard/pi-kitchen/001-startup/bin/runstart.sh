#!/bin/sh
#Generate logfile for the last runstart executed.
logfile=/home/pi/bin/_RUNSTART/runstart.log

echo ">>>>>>>>>>>>>>"
echo ">>>>>>>>>>>>>>" > $logfile
echo "Run runstart script"
echo "Run runstart script" >> $logfile
date >> $logfile

#This will run all the sh files placed in the ~/bin/_RUNSTART directory
cd /home/pi/bin/_RUNSTART
list=`ls *.sh`
for script in $list
do
echo ">>> Running: $script"
echo ">>> Running: $script" >> $logfile
date >> $logfile
sh "$script"
done

#This will run all the sh files placed in the ~/recovery/_USER/_RUNSTART directory
cd /home/pi/recovery/_USER/_RUNSTART
list=`ls *.sh`
for script in $list
do
echo ">>> Running User: $script"
echo ">>> Running User: $script" >> $logfile
date >> $logfile
sh "$script"
done

#Finish logfile
echo "Run runstart script Done" >> $logfile
date >> $logfile
echo ">>>>>>>>>>>>>>" >> $logfile
