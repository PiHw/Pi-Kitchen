By using the Samba share setup by <a href="http://pihardware.com/guides/pi-kitchen/networkshare/">Recipe 007: Network Share</a> we can access the files on the Raspberry Pi from other computers.  However, we can also share files over the network by accessing files which are located on other computers (or network drives if you have one).

You will need a standard Windows share setup on your network (or a linux Samba share - such as another Raspberry Pi with a shared folder).

Next update the `mapnetworkshare.sh` script located in the `_SETTINGS/009-map-network-share` directory to include the network share, mounting folder (and if required the username and password).

<img style="float:left" src="IMG_SRC/note.png" height=40/>
<b>NOTE:</b> You may find that you have to use the IP address of the computer (i.e. 192.168.0.10) you want to connect to, rather than its hostname (i.e. PCNAME).

##Sec mode##
"sec" is the security mode and determines how passwords are encrypted between server and client ( even if you don't require passwords ).

ntlm used to be the default which is why you never had to specify it discretely. Things have moved on however so the default is now ntlmssp. If you are accessing something which doesn't speak ntlmssp you have to override the new default with the old one.

Most NAS devices use older technology so they often require ntlm. If you access an OSX samba share however it requires ntlmssp so before you had to specify that in the mount options but now you don't.

This change applies between NOOBS 1.3.11 going to NOOBS 1.3.12 onwards (as the version of cifs has been updated in the included version Raspbian).

##References##
For more details about mounting network shares, see the following site (which provided the details needed to create this recipe):
<a href="http://rasspberrypi.wordpress.com/2012/09/04/mounting-and-automounting-windows-shares-on-raspberry-pi/">Raspberry Pi Adventures - Mounting and Automounting Windows Shares on Raspberry Pi</a>
<a href="http://geeks.noeit.com/mount-an-smb-network-drive-on-raspberry-pi/">Noeit Geeks - mount an SMB Network Drive on Raspberry Pi (including putting your username and password in a secure credentials file).</a>
<a href="http://ubuntuforums.org/showthread.php?t=2230952">Why do I have to use sec=ntlm to get CIFS shares mounted?</a>