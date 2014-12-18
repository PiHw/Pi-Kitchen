<!-- How to use comments in these files -->
<!-- ---------------------------------- -->
<!--Comments have been put in this file so that they can be customised for a range of workshops and uses.

[How to customise the Markdown documents](CustomMarkdown.md)-->














<img src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/pihwlogotm.png" width=180 />
<hr>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />
#Recipe Card#

<font color = GREEN>
<h1>002 : Boot Display</h1>
</font>

<table style="width:35%" align="right" >
  <tr>
    <th bgcolor=black><font color=white>Recipe Files</th>
    <th bgcolor=black><font color=white>Ingredients</th>
  </tr>
  <tr>
    <td>
          <i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/002-bootdisplay/RECIPE_FILE_boot.txt">(flavour)_boot.txt</a></i></b><p>
              <i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/002-bootdisplay/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b><p>
            </td>		
    <td><i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/002-bootdisplay_INGREDIENTS.zip">002-bootdisplay_INGREDIENTS.zip</a></i></b></td>
  </tr>
</table>


See the markdown version of this recipe on the <a href="https://github.com/PiHw/Pi-Kitchen">Pi-Kitchen GitHub</a> site see:
<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/002-bootdisplay_RECIPE_CARD.md">002-Boot Display.md</a>

<br>


##Description##
<font color = GREEN>
<!--<p> Moved description from RECIPE_CARD.txt to README.md file-->
This recipe places a range of selectable display settings on to the SD-Card.

The config.txt allows you to specify the configuration of the Raspberry Pi on boot (such as the display).

This allows you to specify the specific display you wish to use with the Raspberry Pi when it boots.  You can select a particular display within the recipe file as well as change the selected display using the supplied script.

In addition to the display output type you can also specify a number of options to fine tune the display:

- overscan values for left/right/top/bottom allow you to remove any black boarders/overlap off the screen

- framebuffer height and width allows adjustment of the screen resolution (useful for small screens)

This is particularly useful if you are using a smaller/custom screen where the output is difficult to read if not configured carefully.

The intention is that if you use a range of different screens you can add your own variants to the supplied configurations.  This will allow you to quickly and easily switch between them (as well as apply the settings automatically as part of your Pi-Kitchen installation).

This file can also control more than the display settings (such as codex licensing and overclocking), more details are available here:
<a href="http://elinux.org/RPiconfig">Raspberry Pi (elinux) Wiki for RPiconfig</a>. 

A fully documented version of the config.txt file is available here:
<a href="https://raw.githubusercontent.com/Evilpaul/RPi-config/master/config.txt">Documented config.txt</a></font>

##How to use##
<font color = GREEN>
Enable/Disable by running <code>sudo ./bin/switchdisp.sh</code><p>
</font>

##Ingredients##
The ingredient files should be placed in the following location on the NOOBS RECOVERY partition:<p>

<font color = GREEN>
<code>pi-kitchen/002-bootdisplay</code><p>
</font>

This recipe uses the following files:<p>
<font color = GREEN>
hdminormal/config.txt<p> hdmiforced/config.txt<p> sdtvpal/config.txt<p> sdtvntsc/config.txt<p> switchdisp.sh<p><p>
</font>


You can download all the <a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/002-bootdisplay_INGREDIENTS.zip">ingredient files</a>, and extracted directly to the NOOBS SD-Card (ensuring you remove the ZIP file's name from the directory - the files should be extracted to <code>pi-kitchen/002-bootdisplay</code>).<p>

##The Recipe Files##
Each recipe will use one file for each of the partitions it installs to - boot, root and data).<p>


You will need to suitably rename or copy the content of each of the following files into your recipe files (i.e. <code>RaspbianPiKitchen_root.txt</code>) and place them in your os folder in the NOOBS partition (i.e. <code>os/Raspbian</code>).<p>

For more information see the <a href="http://pihw.wordpress.com/guides/pi-kitchen/creatingflavours">Pi-Kitchen: Creating Flavours</a> guide.<p>

<i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/002-bootdisplay/RECIPE_FILE_boot.txt">(flavour)_boot.txt</a></i></b>
<pre>
#
#Recipe: 002-bootdisplay
#Configure the boot settings:
#-- Only one config.txt file should be applied at any one time (only comment one out)
#- HDMI Normal - Default setting will detect HDMI connection on power up
../../pi-kitchen/002-bootdisplay/hdminormal/config.txt
#- HDMI Forced - Will always select HDMI output
#../../pi-kitchen/002-bootdisplay/hdmiforced/config.txt
#- SD PAL - Set composite video output to PAL
#../../pi-kitchen/002-bootdisplay/sdtvpal/config.txt
#- SD NTSC - Set composite video output to PAL
#../../pi-kitchen/002-bootdisplay/sdtvntsc/config.txt
#
#Add switchdisp files:
../../pi-kitchen/002-bootdisplay/hdminormal/config.txt /display/hdminormal
../../pi-kitchen/002-bootdisplay/hdmiforced/config.txt /display/hdmiforced
../../pi-kitchen/002-bootdisplay/sdtvpal/config.txt /display/sdtvpal
../../pi-kitchen/002-bootdisplay/sdtvntsc/config.txt /display/sdtvntsc</pre>

<i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/002-bootdisplay/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b>
<pre>
#
#Recipe: 002-bootdisplay
#Add switchdisp files:
#- switchdisp.sh should be set as executable
../../pi-kitchen/002-bootdisplay/switchdisp.sh /home/pi/bin +x</pre>



<hr>

Enjoy baking your Raspberry Pi SD-Card fresh from the Pi-Kitchen.<p>

<!--========================END FILE================-->
