#!/bin/sh
echo "Run runstart script"

#This will run all the sh files placed in the ~/bin/_RUNSTART directory
cd /home/pi/bin/_RUNSTART
list=`ls *.sh`
for script in $list
do
echo ">>> Running: $script"
sh "$script"
done

#This will run all the sh files placed in the ~/recovery/_USER/_RUNSTART directory
cd /home/pi/recovery/_USER/_RUNSTART
list=`ls *.sh`
for script in $list
do
echo ">>> Running: $script"
sh "$script"
done
