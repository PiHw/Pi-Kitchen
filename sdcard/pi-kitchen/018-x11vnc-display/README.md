#X11VNC Default Password#

The default password is set as `raspberry`, if you want to change this then generate a new `~/.vnc/passwd` using the following command (where apassword is your new password):

	x11vnc -storepasswd apassword ~/.vnc/passwd

You can then replace the passwd file in the recipe if you always want to use the new password as your own default (however just remember that the file will be available on the SD-Card if someone looks for it).

#Required Packages#
tcl8.6
tcl
tk8.6
tk
x11vnc-data
libvncclient0
libvncserver0
x11vnc

Installed with:

	sudo dpkg -i deb/*.deb