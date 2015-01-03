By using the Samba share setup by <a href="http://pihardware.com/guides/pi-kitchen/networkshare/">Recipe 007: Network Share</a> we can access the files on the Raspberry Pi from other computers.  However, we can also share files over the network by accessing files which are located on other computers (or network drives if you have one).

You will need a standard Windows share setup on your network (or a linux Samba share - such as another Raspberry Pi with a shared folder).

Next update the `mapnetworkshare.sh` script located in the `_SETTINGS/009-map-network-share` directory to include the network share, mounting folder (and if required the username and password).

<img style="float:left" src="IMG_SRC/note.png" height=40/>
<b>NOTE:</b> You may find that you have to use the IP address of the computer (i.e. 192.168.0.10) you want to connect to, rather than its hostname (i.e. PCNAME).

##References##
For more details about mounting network shares, see the following site (which provided the details needed to create this recipe):
<a href="http://rasspberrypi.wordpress.com/2012/09/04/mounting-and-automounting-windows-shares-on-rasperry-pi/">Raspberry Pi Adventures - Mounting and Automounting Windows Shares on Raspberry Pi</a>
