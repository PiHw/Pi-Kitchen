<!-- How to use comments in these files -->
<!-- ---------------------------------- -->
<!--Comments have been put in this file so that they can be automatically generated.

[How to customise the Markdown documents](CustomMarkdown.md)-->
<!--Template 03/01/2015-->

















<img src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/pihwlogotm.png" width=180 />
<hr>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />
#Recipe Card#

<font color = GREEN>
<h1>003 : Direct Network Connection</h1>
</font>

<table style="width:35%" align="right" >
  <tr>
    <th bgcolor=black><font color=white>Recipe Files</th>
    <th bgcolor=black><font color=white>Ingredients</th>
  </tr>
  <tr>
    <td>
          <i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/003-direct-network/RECIPE_FILE_boot.txt">(flavour)_boot.txt</a></i></b><p>
              <i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/003-direct-network/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b><p>
            </td>		
    <td><i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/003-direct-network_INGREDIENTS.zip">003-direct-network_INGREDIENTS.zip</a></i></b></td>
  </tr>
    <tr>
    <td>
      <i><b>Tested: Raspbian</i></b>
    </td>
  </tr>
  </table>


See the markdown version of this recipe on the <a href="https://github.com/PiHw/Pi-Kitchen">Pi-Kitchen GitHub</a> site see:
<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/003-direct-network_RECIPE_CARD.md">003-Direct Network Connection.md</a>

<br>


##Description##
<font color = GREEN>
This recipe places the direct network connection scripts on to the SD-Card.<p>  See <a href="http://pihw.wordpress.com/guides/direct-network-connection/super-easy-direct-network-connection/">Super Easy Direct Network Connection</a>.  

<img src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/directconnection.png" width=400 />

The cmdline.txt allows you to specify the IP address of the Raspberry Pi on boot.

This allows you to setup an IP address suitable for a direct network link (using a single network cable to a PC or laptop).

The resulting connection is just like a normal network so you can share files using SMB and remote connect using SSH, as well as use X-Forwarding to remotely run graphical programs (or use VNC).

The direct connection IP address is set to 169.254.69.69</font>

##How to use##
<font color = GREEN>
Enable/Disable by running <code>sudo ./bin/switchip.sh</code><p>
</font>

##Ingredients##
The ingredient files should be placed in the following location on the NOOBS RECOVERY partition:<p>

<font color = GREEN>
<code>pi-kitchen/003-direct-network</code><p>
</font>

This recipe uses the following files:<p>
<font color = GREEN>
direct/cmdline.txt<p> normal/cmdline.txt<p> switchip.sh<p><p>
</font>

<b>Plus the following files in the _SETTINGS folder:</b><p>

It is assumed that the following file(s) are placed in the following location on the NOOBS RECOVERY partition:<p>
<font color = GREEN>
<code>pi-kitchen/_SETTINGS/003-direct-network</code><p>
</font>

You will need the following _SETTINGS file(s):<p>

<font color = GREEN>
internet/cmdline.txt<p><p>
</font>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/note.png" height=40/>
<b>NOTE:</b> Files which are configured manually or may contain sensitive information are placed in the _SETTTINGS directory on the SD-Card.  This is so that it is easier to support different configurations and remove sensitive information from the setup if needed.<p>

Perform the following actions:<p>
<font color = GREEN>
Ensure you update cmdline.internet with the PC's IP address as the gateway.<p>
</font>

You can download all the <a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/003-direct-network_INGREDIENTS.zip">ingredient files</a>, and extracted directly to the NOOBS SD-Card (ensuring you remove the ZIP file's name from the directory - the files should be extracted to <code>pi-kitchen/003-direct-network</code>).<p>

##The Recipe Files##
Each recipe will use one file for each of the partitions it installs to - boot, root and data).<p>


You will need to suitably rename or copy the content of each of the following files into your recipe files (i.e. <code>RaspbianPiKitchen_root.txt</code>) and place them in your os folder in the NOOBS partition (i.e. <code>os/Raspbian</code>).<p>

For more information see the <a href="http://pihw.wordpress.com/guides/pi-kitchen/creatingflavours">Pi-Kitchen: Creating Flavours</a> guide.<p>

<i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/003-direct-network/RECIPE_FILE_boot.txt">(flavour)_boot.txt</a></i></b>
<pre>
#
#Recipe: 003-direct-network
#Configure the boot settings:
#-- Only one cmdline.txt file should be applied at any one time (only comment one out)
#- Direct network settings - for direct connections with a PC using just a network cable
../../pi-kitchen/003-direct-network/direct/cmdline.txt
#- Normal network settings - for normal use with a standard home network
#../../pi-kitchen/003-direct-network/normal/cmdline.txt
#- Internet Connection Sharing requires specific settings for you own network so stored in _SETTINGS
#../../pi-kitchen/_SETTINGS/003-direct-network/internet/cmdline.txt
#
#Add switchip files:
../../pi-kitchen/003-direct-network/direct/cmdline.txt /network/direct
../../pi-kitchen/003-direct-network/normal/cmdline.txt /network/normal
../../pi-kitchen/_SETTINGS/003-direct-network/internet/cmdline.txt /network/internet</pre>

<i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/003-direct-network/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b>
<pre>
#
#Recipe: 003-direct-network
#Add switchip files:
#- switchip.sh should be set as executable
../../pi-kitchen/003-direct-network/switchip.sh /home/pi/bin +x</pre>



<hr>

Enjoy baking your Raspberry Pi SD-Card fresh from the Pi-Kitchen.<p>

<!--========================END FILE================-->
