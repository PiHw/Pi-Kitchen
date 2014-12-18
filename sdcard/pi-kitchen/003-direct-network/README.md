This recipe places the direct network connection scripts on to the SD-Card.<p>  See <a href="http://pihw.wordpress.com/guides/direct-network-connection/super-easy-direct-network-connection/">Super Easy Direct Network Connection</a>.  

<img src="IMG_SRC/directconnection.png" width=400 />

The cmdline.txt allows you to specify the IP address of the Raspberry Pi on boot.

This allows you to setup an IP address suitable for a direct network link (using a single network cable to a PC or laptop).

The resulting connection is just like a normal network so you can share files using SMB and remote connect using SSH, as well as use X-Forwarding to remotely run graphical programs (or use VNC).

The direct connection IP address is set to 169.254.69.69