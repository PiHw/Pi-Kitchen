<!-- How to use comments in these files -->
<!-- ---------------------------------- -->
<!--Comments have been put in this file so that they can be customised for a range of workshops and uses.

[How to customise the Markdown documents](CustomMarkdown.md)-->
















<img src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/pihwlogotm.png" width=180 />
----------

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 /> #Recipe Card#

<font color = GREEN>
#(001) Direct Network Connection#
</font>

<font color = GREEN>
This recipe places the direct network connection scrips on to the SD-Card.<p>  See [Super Easy Direct Network Connection](http://pihw.wordpress.com/guides/direct-network-connection/super-easy-direct-network-connection/).  <p><img src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/directconnection.png" width=400 /> <p>The cmdline.txt allows you to specify the IP address of the Raspberry Pi on boot.<p>This allows you to setup an IP address suitable for a direct network link (using a single network cable to a PC or laptop).<p>The resulting connection is just like a normal network so you can share files using SMB and remote connect using SSH, as well as use X-Forwarding to remotely run graphical programs (or use VNC).<p><p>The direct connection IP address is set to 169.254.69.69<p><p>
</font>

<font color = GREEN>
Enable/Disable by running <code>sudo ./bin/switch.sh</code><p>
</font>

##The Ingredient Files##
Unless otherwise stated files should be placed in the following location on the NOOBS RECOVERY partition:<p>

<font color = GREEN>
<code>pi-kitchen/direct-network</code><p>
</font>

<b>This recipe uses the following files:</b><p>
<font color = GREEN>
<code>direct/cmdline.txt<p> normal/cmdline.txt<p> switch.ip<p></code><p>
</font>

<b>Plus the following files in the _SETTINGS folder:</b><p>

It is assumed that the following file(s) are placed in the following location on the NOOBS RECOVERY partition:<p>
<font color = GREEN>
<code>pi-kitchen/_SETTINGS/direct-network</code><p>
</font>

You will need the following _SETTINGS file(s):<p>

<font color = GREEN>
internet/cmdline.txt<p><p>
</font>

> <img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/note.png" height=40/>
> **NOTE:** Files which are configured manually or may contain sensitive information are placed in the _SETTTINGS directory on the SD-Card.  This is so that it is easier to support different configurations and remove sensitive information from the setup if needed.<p>

Perform the following actions:<p>
<font color = GREEN>
Ensure you update cmdline.internet with the PC's IP address as the gateway.<p>
</font>

##The Recipe Files##
Each recipe can use up to three files (one for each of the three main partitions - boot, root and data).

> <img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/note.png" height=40/>
> **NOTE:** The data partition does not normally exist for most installations unless manually selected.  However you can also include this partition automatically if desired (see the [Pi-Kitchen: Automatic Installations](PiKitchen-AutomaticInstallations.md) guide for more details).<p>

You will need to suitably rename or copy the content of each of the following files into your recipe files (i.e. <code>RaspbianPiKitchen_root.txt</code>) and place them in your os folder in the NOOBS partition (i.e. <code>os/Raspbian</code>).<p>

For more information see the [Pi-Kitchen: Creating Flavours](PiKitchen-CreatingFlavours.md) guide.<p>

***(flavour)_boot.txt***
<pre>
#
#Recipe: direct-network
#Configure the boot settings:
#-- Only one cmdline.txt file should be applied at any one time (only comment one out)
#- Direct network settings - for direct connections with a PC using just a network cable
../../pi-kitchen/direct-network/direct/cmdline.txt
#- Normal network settings - for normal use with a standard home network
#../../pi-kitchen/direct-network/normal/cmdline.txt
#- Internet Connection Sharing requires specific settings for you own network so stored in _SETTINGS
#../../pi-kitchen/_SETTINGS/direct-network/internet/cmdline.txt
#
#Add switchip files:
../../pi-kitchen/direct-network/direct/cmdline.txt /direct
../../pi-kitchen/direct-network/normal/cmdline.txt /normal
../../pi-kitchen/_SETTINGS/direct-network/internet/cmdline.txt /internet</pre>

***(flavour)_root.txt***
<pre>
#
#Recipe: direct-network
#Add switchip files:
#- switchip.sh should be set as executable
../../pi-kitchen/direct-network/switchip.sh /home/pi/bin +x</pre>



---------
Enjoy baking your Raspberry Pi SD-Card fresh from the Pi-Kitchen.

<!--========================END FILE================-->
