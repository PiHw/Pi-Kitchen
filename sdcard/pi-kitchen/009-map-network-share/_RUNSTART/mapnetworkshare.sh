#!/bin/sh
# Set network share and mount address 
share="//IP_ADDRESS/Folder"
mount="/home/pi/network"

# If needed set username and password
# Uncomment if needed
#nwusername=yourusername
#nwpassword=yourusername

# Mount shared drive as a guest (no username or password needed)
sudo mount -t cifs -o guest $share $mount

# Mount shared drive using username and password
# Uncomment if needed
#sudo mount -t cifs -o username=$nwusername,password=$nwpassword $share $mount