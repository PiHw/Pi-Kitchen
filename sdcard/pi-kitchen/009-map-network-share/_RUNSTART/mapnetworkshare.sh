#!/bin/sh
#
# NOTE: By default the recipe will use the copy of this file located in the _SETTINGS directory
#       as it contains information which you want to remove if sharing your files.
#
# Set network share and mount address 
share="//IP_ADDRESS/Folder"
mount="/home/pi/network"

# If needed set username and password
# NOTE: Be aware if you want to keep your password private you should take care no one has 
#       access to your SDCard.
#       Alternatively modify this script to prompt you for your password and run it when you login.
# Uncomment if needed
#nwusername=yourusername
#nwpassword=yourusername

#Set sec mode
# Old versions of cifs uses default of ntlm, new cifs uses ntlmssp as default
# Which you need will depend on your shared drive
secsetting=ntlm

# Uncomment required share method:
# Mount shared drive as a guest (no username or password needed)
sudo mount -t cifs -o guest,sec=$secsetting $share $mount

# Mount shared drive using username and password
#sudo mount -t cifs -o sec=$secsetting,username=$nwusername,password=$nwpassword $share $mount

# If you want full rights on the share folder:
#sudo mount -t cifs -o sec=$secsetting,user=$nwusername,password=$nwpassword,rw,file_mode=0777,dir_mode=0777 $share $mount