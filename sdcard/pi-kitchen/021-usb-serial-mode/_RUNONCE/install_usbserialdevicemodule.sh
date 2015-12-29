#!/bin/sh
#Enable the Serial Gadget service
sudo systemctl enable getty@ttyGSO.service

#Confirm service has started
echo "USB Serial Device is..."
sudo systemctl is-active getty@ttyGSO.service