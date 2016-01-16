#!/bin/sh
#Generate logfile for the last runstart executed.
logfile=/home/pi/bin/_INSTALLONCE/installonce.log
echo ">>>>>>>>>>>>>>"
echo ">>>>>>>>>>>>>>" > $logfile
echo "Run installonce script"
echo "Run installonce script" >> $logfile
date >> $logfile


#This will run all the sh files placed in the ~/bin/_INSTALLONCE directory
cd /home/pi/bin/_INSTALLONCE
list=`ls *.sh`
for script in $list
do
echo ">>> Running: $script"
echo ">>> Running: $script" >> $logfile
date >> $logfile
sh "$script"
done

#Finish logfile
echo "Run installonce script Done" >> $logfile
date >> $logfile
echo ">>>>>>>>>>>>>>" >> $logfile
