#!/bin/sh
#Enable automatic boot to desktop
update-rc.d lightdm enable 2 #install lightdm in boot sequence
sed etc/lightdm/lightdm.conf -i -e s^#autologin-user=.autologin-user=pi