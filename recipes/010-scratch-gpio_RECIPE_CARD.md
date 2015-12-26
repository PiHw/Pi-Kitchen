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
<h1>010 : Scratch GPIO</h1>
</font>

<table style="width:35%" align="right" >
  <tr>
    <th bgcolor=black><font color=white>Recipe Files</th>
    <th bgcolor=black><font color=white>Ingredients</th>
  </tr>
  <tr>
    <td>
              <i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/010-scratch-gpio/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b><p>
            </td>		
    <td><i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/010-scratch-gpio_INGREDIENTS.zip">010-scratch-gpio_INGREDIENTS.zip</a></i></b></td>
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
###Introducing Scratch GPIO###

**Scratch GPIO** was created by **Simon Walters (@cymplecy)** to allow Scratch to interact with physical hardware.  Full details of Scratch GPIO is available on his website:

[http://simplesi.net/scratchgpio/scratch-raspberrypi-gpio/](http://simplesi.net/scratchgpio/scratch-raspberrypi-gpio/)

###Installation###
The recipe includes the Scratch GPIO installation script, allowing it to be installed without requiring an internet connection.  You can also choose to download and install the latest version of the script and also update the script stored in the recipe.

The installation script (`install_scratchgpioX.sh`) is placed in the `_INSTALLONCE` directory, so the user can select the method of installation.

If the **Scratch GPIO** link changes (i.e. if a new version is released) then update `install_scratchgpioX.sh` as required.

> <img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/warn.png" height=40/>
> <b>WARNING: Using Scratch with remote connections </b>
> 
> Currently, there is an issue with Scratch 4 which causes it not to work correctly with **X-11 Forwarding**.  The issue results in "=" characters being generated while connected (this makes Scratch hard to use when you need to type anything).
> 
> Therefore if you need to use **Scratch** via the network you will need to use **VNC** or similar.

</font>

##How to use##
<font color = GREEN>
Run the `installonce.sh` script to install Scratch GPIO.<p><p>
</font>

##Ingredients##
The ingredient files should be placed in the following location on the NOOBS RECOVERY partition:<p>

<font color = GREEN>
<code>pi-kitchen/010-scratch-gpio</code><p>
</font>

This recipe uses the following files:<p>
<font color = GREEN>
bin/_INSTALLONCE/install_scratchgpio.sh<p>
</font>


You can download all the <a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/010-scratch-gpio_INGREDIENTS.zip">ingredient files</a>, and extracted directly to the NOOBS SD-Card (ensuring you remove the ZIP file's name from the directory - the files should be extracted to <code>pi-kitchen/010-scratch-gpio</code>).<p>

##The Recipe Files##
Each recipe will use one file for each of the partitions it installs to - boot, root and data).<p>


You will need to suitably rename or copy the content of each of the following files into your recipe files (i.e. <code>RaspbianPiKitchen_root.txt</code>) and place them in your os folder in the NOOBS partition (i.e. <code>os/Raspbian</code>).<p>

For more information see the <a href="http://pihw.wordpress.com/guides/pi-kitchen/creatingflavours">Pi-Kitchen: Creating Flavours</a> guide.<p>


<i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/010-scratch-gpio/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b>
<pre>
#
#Recipe: 010-scratch-gpio
#- Add script to _INSTALLONCE folder
../../pi-kitchen/010-scratch-gpio/_INSTALLONCE/install_scratchgpio.sh /home/pi/bin/_INSTALLONCE

</pre>



<hr>

Enjoy baking your Raspberry Pi SD-Card fresh from the Pi-Kitchen.<p>

<!--========================END FILE================-->
