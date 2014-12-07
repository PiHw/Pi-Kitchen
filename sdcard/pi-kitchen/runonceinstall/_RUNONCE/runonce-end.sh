#!/bin/sh
echo "Swap start up files so runonce routine does not run again"
cp /home/pi/bin/startup.sh /home/pi/bin/startup_old.sh
mv /home/pi/bin/startup_normal.sh /home/pi/bin/startup.sh