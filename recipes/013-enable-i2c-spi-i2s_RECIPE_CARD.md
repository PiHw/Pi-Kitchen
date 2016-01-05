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
<h1>013 : Enable I2C, SPI and I2S</h1>
</font>

<table style="width:35%" align="right" >
  <tr>
    <th bgcolor=black><font color=white>Recipe Files</th>
    <th bgcolor=black><font color=white>Ingredients</th>
  </tr>
  <tr>
    <td>
              <i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/013-enable-i2c-spi-i2s/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b><p>
            </td>		
    <td><i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/013-enable-i2c-spi-i2s_INGREDIENTS.zip">013-enable-i2c-spi-i2s_INGREDIENTS.zip</a></i></b></td>
  </tr>
    <tr>
    <td>
      <i><b>Tested: Raspbian</i></b>
    </td>
  </tr>
  </table>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/warn.png" height=40/>
<b>WARNING:</b> This recipe also requires the following recipe(s) to be setup on the SD-Card:<p>
<font color = GREEN>
<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/Recipe 001-Startup">Recipe 001-Startup</a><p>
</font>

<br>


##Description##
<font color = GREEN>
#Install i2ctools#
i2c-tools
`sudo apt-get install i2c-tools`

Get package:
`sudo apt-get download i2c-tools`

Install package:
`sudo dpkg -i i2c-tools*.deb`

#Enable I2C Driver#
Add to `/boot/config.txt`:

`dtparam=i2c=on,i2s=on,spi=on`

Add to `/etc/modules`:

   i2c-dev
   i2c-bcm2708 #May not be needed
   
Normally we would add this on the first run (via _RUNONCE) however, it would be helpful to have it enabled on the first run too.  Therefore we may use external overlays to achieve what we want (which can be added/removed as required).

#Using External Overlays#
This method requires the following to be added to the `config.txt` file, which will attempt to load:

   dtoverlay=enable-i2c-arm
   dtoverlay=enable-i2s
   dtoverlay=enable-spi
   
**Note:** Since the **002-bootdisplay** recipe uses the `config.txt` to set the different display settings, these items should be added to each of the `config.txt` files used.  A standard HDMI `config.txt` file is also included in this recipe, in case you don't want to include the **002-bootdisplay** in your setup.

We can then add each of the required overlay files into the `/boot/overlays` folder:

   enable-i2c-arm-overlay.dtb
   enable-i2s-overlay.dtb
   enable-spi-overlay.dtb

If the overlay file isn't there, the driver is simply not loaded - so we can control what we add via our recipe or flavour file.
   
##Reference##
Thanks to PhilE for the information needed to implement the external overlay method:
http://www.raspberrypi.org/forums/viewtopic.php?f=28&t=97314&start=50#p703747

#Wire I2C Device#

2[=============]26[=======]40
1[VDC=X========]25[=======]39
V=VCC 3.3V
D=I2C Data
C=I2C Clock
X=Gnd

#Use I2C Detect#
`sudo i2cdetect -y 1`


     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: 50 -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- 68 -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --
</font>

##How to use##
<font color = GREEN>
<p>
</font>

##Ingredients##
The ingredient files should be placed in the following location on the NOOBS RECOVERY partition:<p>

<font color = GREEN>
<code>pi-kitchen/013-enable-i2c-spi-i2s</code><p>
</font>

This recipe uses the following files:<p>
<font color = GREEN>
bin/_INSTALLONCE/install_i2ctools.sh<p>bin/_RUNONCE/enable_i2c-spi.sh<p>boot/config.txt<p>boot/overlays/enable-i2c-arm-overlay.dtb<p>boot/overlays/enable-i2s-overlay.dtb<p>boot/overlays/enable-spi-overlay.dtb<p>
</font>


You can download all the <a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/013-enable-i2c-spi-i2s_INGREDIENTS.zip">ingredient files</a>, and extracted directly to the NOOBS SD-Card (ensuring you remove the ZIP file's name from the directory - the files should be extracted to <code>pi-kitchen/013-enable-i2c-spi-i2s</code>).<p>

##The Recipe Files##
Each recipe will use one file for each of the partitions it installs to - boot, root and data).<p>


You will need to suitably rename or copy the content of each of the following files into your recipe files (i.e. <code>RaspbianPiKitchen_root.txt</code>) and place them in your os folder in the NOOBS partition (i.e. <code>os/Raspbian</code>).<p>

For more information see the <a href="http://pihw.wordpress.com/guides/pi-kitchen/creatingflavours">Pi-Kitchen: Creating Flavours</a> guide.<p>


<i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/013-enable-i2c-spi-i2s/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b>
<pre>
#
#Recipe: 013-enable-i2c-spi-i2s
#NOTE: Driver will be enabled by adding/removing the overlay file in the boot/overlay folder
#- Add scripts to _RUNONCE and _INSTALLONCE folders
../../pi-kitchen/013-enable-i2c-spi-i2s/_RUNONCE/enable_i2c-spi.sh /home/pi/bin/_RUNONCE
../../pi-kitchen/013-enable-i2c-spi-i2s/_INSTALLONCE/install_i2ctools.sh /home/pi/bin/_INSTALLONCE

</pre>



<hr>

Enjoy baking your Raspberry Pi SD-Card fresh from the Pi-Kitchen.<p>

<!--========================END FILE================-->
