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
<h1>005 : Wifi Configuration</h1>
</font>

<table style="width:35%" align="right" >
  <tr>
    <th bgcolor=black><font color=white>Recipe Files</th>
    <th bgcolor=black><font color=white>Ingredients</th>
  </tr>
  <tr>
    <td>
              <i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/005-wifi/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b><p>
            </td>		
    <td><i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/005-wifi_INGREDIENTS.zip">005-wifi_INGREDIENTS.zip</a></i></b></td>
  </tr>
    <tr>
    <td>
      <i><b>Tested: Raspbian</i></b>
    </td>
  </tr>
  </table>


See the markdown version of this recipe on the <a href="https://github.com/PiHw/Pi-Kitchen">Pi-Kitchen GitHub</a> site see:
<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/005-wifi_RECIPE_CARD.md">005-Wifi Configuration.md</a>

<br>


##Description##
<font color = GREEN>
<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/warn.png" height=40/>
<b>WARNING:</b> The following assumes that you have a working wired network (or a wireless adaptor which doesn't need additional drivers).

Check out the <a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/006-wifi-driver_RECIPE_CARD.md">Wifi driver recipe</a> if you need help identifying the wifi adaptor or want to install the drivers without a **working** network connection.

##Drivers##

###Installing the wifi drivers, using `install_wifi-devices.sh`###

The `install_wifi-devices.sh` script will allow the required wifi drivers to be installed during the first start up.  The `install_wifi-devices.sh` script should be placed in the `_RUNONCE` directory.

For each driver you want to install, where <packagename> is the driver listed from searching `apt-cache`:

`sudo apt-get install <packagename>`

e.g. For **firmware-ralink** add the following to `install_wifi-devices.sh`:

`sudo apt-get install firmware-ralink`

##Wifi Settings##
###The `interfaces` file###
This replaces the standard `etcnetworkinterfaces` file with one which uses `etcwpa.conf` for the wifi settings.

    auto lo
    
    iface lo inet loopback
    iface eth0 inet dhcp
    
    iface default inet dhcp
    
    auto wlan0
    iface wlan0 inet dhcp
    
    wpa-conf /etc/wpa.conf


<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/note.png" height=40/>
<b>NOTE:</b> Some devices will have different names to `wlan0` (i.e. `ra0`) so you may need to adjust this file.


###The `wpa.conf` file###
The `wpa.conf` file should detail the wifi settings as follows:


    network={
      ssid="firstnetwork"
      key_mgmt=WPA-PSK
      psk="passphrase1"
    }
    network={
      ssid="secondnetwork"
      key_mgmt=WPA-PSK
      psk="passphrase1"
    }



<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/note.png" height=40/>
<b>NOTE:</b> We place this file in **_SETTINGS** so that it is easier to remove sensitive information from our configurations.
> 
> An example `wpa.conf` is provided in `pi-kitchen005-wifietc` directory.

</font>

##How to use##
<font color = GREEN>
1.Identify your Wifi adaptor.<p>2.Ensure `install_wifi-devices.sh` will install the correct **package** for your device.<p>3.Insert your Wifi settings into the `wpa.conf` file.<p>
</font>

##Ingredients##
The ingredient files should be placed in the following location on the NOOBS RECOVERY partition:<p>

<font color = GREEN>
<code>pi-kitchen/005-wifi</code><p>
</font>

This recipe uses the following files:<p>
<font color = GREEN>
etc/network/interfaces<p> _RUNONCE/install_wifi-devices.sh<p>
</font>

<b>Plus the following files in the _SETTINGS folder:</b><p>

It is assumed that the following file(s) are placed in the following location on the NOOBS RECOVERY partition:<p>
<font color = GREEN>
<code>pi-kitchen/_SETTINGS/005-wifi</code><p>
</font>

You will need the following _SETTINGS file(s):<p>

<font color = GREEN>
005-wifi/wifi_example/wpa.conf<p><p>
</font>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/note.png" height=40/>
<b>NOTE:</b> Files which are configured manually or may contain sensitive information are placed in the _SETTTINGS directory on the SD-Card.  This is so that it is easier to support different configurations and remove sensitive information from the setup if needed.<p>

Perform the following actions:<p>
<font color = GREEN>
Ensure you update wpa.config with your own Wifi SSID and pass-phrase.<p>
</font>

You can download all the <a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/005-wifi_INGREDIENTS.zip">ingredient files</a>, and extracted directly to the NOOBS SD-Card (ensuring you remove the ZIP file's name from the directory - the files should be extracted to <code>pi-kitchen/005-wifi</code>).<p>

##The Recipe Files##
Each recipe will use one file for each of the partitions it installs to - boot, root and data).<p>


You will need to suitably rename or copy the content of each of the following files into your recipe files (i.e. <code>RaspbianPiKitchen_root.txt</code>) and place them in your os folder in the NOOBS partition (i.e. <code>os/Raspbian</code>).<p>

For more information see the <a href="http://pihw.wordpress.com/guides/pi-kitchen/creatingflavours">Pi-Kitchen: Creating Flavours</a> guide.<p>


<i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/005-wifi/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b>
<pre>
#
#Recipe: 005-wifi
#- Setup Wifi interfaces file
../../pi-kitchen/005-wifi/etc/network/interfaces /etc/network
#- Apply the user wifi SETTINGS
#../../pi-kitchen/_SETTINGS/005-wifi/wifi_example/wpa.conf /etc
../../pi-kitchen/_SETTINGS/005-wifi/wifi_home/wpa.conf /etc
#-Install driver(s) for Wifi Adaptor(s)
../../pi-kitchen/005-wifi/_RUNONCE/install_wifi-devices.sh /home/pi/bin/_RUNONCE
</pre>



<hr>

Enjoy baking your Raspberry Pi SD-Card fresh from the Pi-Kitchen.<p>

<!--========================END FILE================-->
