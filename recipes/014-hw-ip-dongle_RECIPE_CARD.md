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
<h1>014 : HW IP Dongle</h1>
</font>

<table style="width:35%" align="right" >
  <tr>
    <th bgcolor=black><font color=white>Recipe Files</th>
    <th bgcolor=black><font color=white>Ingredients</th>
  </tr>
  <tr>
    <td>
              <i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/014-hw-ip-dongle/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b><p>
            </td>		
    <td><i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/014-hw-ip-dongle_INGREDIENTS.zip">014-hw-ip-dongle_INGREDIENTS.zip</a></i></b></td>
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
<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/Recipe 001-Startup and 013-enable-i2c-spi-i2s">Recipe 001-Startup and 013-enable-i2c-spi-i2s</a><p>
</font>

<br>


##Description##
<font color = GREEN>
#HW IP Display Dongle#

This recipe is intended to support the <a href="http://4tronix.co.uk/store/index.php?rt=product/product&keyword=ip&product_id=377">4tronix IP dongle</a>:
<img src="http://4tronix.co.uk/store/resources/image/18/a5/b.jpg"/>

IPDisp uses an I2C Port expander chip, the MCP23017, to drive each of the 7-segment digits and display the current IP address of the Raspberry Pi.

However, this is just an example, as any other 7-segment display (or even an alpha-numeric display) could be used.  Also, we don't have to display just the IP address, you can adjust the script to display anything you want!

##Installation##
The I2C needs to be enabled on the Raspberry Pi, this can be achieved by including the 013-enable-i2c-spi-i2s recipe.

The `i2c-tools` can be used to test if the dongle is attached and the I2C is setup correctly.  With the dongle attached, run the following:

  sudo i2c-detect -y 0
  sudo i2c-detect -y 1

Depending on your Raspberry Pi model you should see the device listed on address 0x20 on one of the I2C buses (newer Pi's will use bus 1).

###smbus###
The current `ipd03.py` script uses **python 2** and `smbus` (to access the I2C bus).  The `smbus-python` package is not installed by default.  This recipe will install it using the `_RUNONCE` folder which will run the following command (or similar if installing using a local copy of the `.deb` file).

  sudo apt-get install smbus-python

To get updated `.deb` file use:

  sudo apt-get update
  sudo apt-get download smbus-python
  
For more information on the IP Display Dongle and the source file used for this recipe, see <a href="http://www.4tronix.co.uk/ipd/"> 4tronix's blog</a>.

</font>

##How to use##
<font color = GREEN>
<p>
</font>

##Ingredients##
The ingredient files should be placed in the following location on the NOOBS RECOVERY partition:<p>

<font color = GREEN>
<code>pi-kitchen/014-hw-ip-dongle</code><p>
</font>

This recipe uses the following files:<p>
<font color = GREEN>
<p>
</font>


You can download all the <a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/014-hw-ip-dongle_INGREDIENTS.zip">ingredient files</a>, and extracted directly to the NOOBS SD-Card (ensuring you remove the ZIP file's name from the directory - the files should be extracted to <code>pi-kitchen/014-hw-ip-dongle</code>).<p>

##The Recipe Files##
Each recipe will use one file for each of the partitions it installs to - boot, root and data).<p>


You will need to suitably rename or copy the content of each of the following files into your recipe files (i.e. <code>RaspbianPiKitchen_root.txt</code>) and place them in your os folder in the NOOBS partition (i.e. <code>os/Raspbian</code>).<p>

For more information see the <a href="http://pihw.wordpress.com/guides/pi-kitchen/creatingflavours">Pi-Kitchen: Creating Flavours</a> guide.<p>


<i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/014-hw-ip-dongle/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b>
<pre>
#
#Recipe: 014-hw-ip-dongle
#- Install smbus using _RUNONCE folder
../../pi-kitchen/014-hw-ip-dongle/_RUNONCE/install_smbus.sh /home/pi/bin/_RUNONCE
#- Add script to _RUNSTARTBG folder and bin folder
../../pi-kitchen/014-hw-ip-dongle/_RUNSTARTBG/run_ipd.sh /home/pi/bin/_RUNSTARTBG
../../pi-kitchen/014-hw-ip-dongle/bin/ipd03.py /home/pi/bin
#- Add IP dongle example program (optional)
../../pi-kitchen/014-hw-ip-dongle/bin/count.py /home/pi/bin
</pre>



<hr>

Enjoy baking your Raspberry Pi SD-Card fresh from the Pi-Kitchen.<p>

<!--========================END FILE================-->
