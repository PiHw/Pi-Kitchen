#!/bin/sh
#Add i2c-dev and i2c-bcm2708 to /etc/modules
sudo echo i2c-dev >> /etc/modules
sudo echo i2c-bcm2708 >> /etc/modules #May not be needed