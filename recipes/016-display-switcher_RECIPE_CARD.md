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
<h1>016 : Display Switcher</h1>
</font>

<table style="width:35%" align="right" >
  <tr>
    <th bgcolor=black><font color=white>Recipe Files</th>
    <th bgcolor=black><font color=white>Ingredients</th>
  </tr>
  <tr>
    <td>
              <i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/016-display-switcher/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b><p>
            </td>		
    <td><i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/016-display-switcher_INGREDIENTS.zip">016-display-switcher_INGREDIENTS.zip</a></i></b></td>
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
<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/"></a><p>
</font>

<br>


##Description##
<font color = GREEN>
#Display Switcher#

This recipe allows the current display mode to be switched (between different HDMI settings to also PAL and NTSC analogue output modes).  You can trigger the next display mode by using the ALT+UP keyboard shortcut.

As you can imagine this is a very useful function to have and I plan to extend the ability of this script over time.

If you run the `bin/display_switcher.py` program the following arguments are supported via the commandline:

next - selects the next display mode in the display_order list

prev - selects the previous display mode in the display_order list

If you run the program without any commandline arguments the following keys are valid:

Enter - show details of current display mode
1-9 - select specific display mode
0/Space - switch display off
Left/Right - select previous/next display mode
c - Cycle through each display mode
l - list available display modes
s - save current mode
q/ESC - Exit
h - help

The script uses `/opt/vc/bin/tvservice` to select between the different modes (by default this is 1-HDMI 2-HDMI Safe* 3-PAL 4-NTSC 5-Off but you can configure it to set whichever modes you use).

*HDMI safe mode isn't quite the same as NOOBS HDMI safe since I've yet to find out the settings it uses.

WARNING: This recipe uses a modified version of inittab (to activate the keyboard shortcut) which is also replaced by recipe 011-boot-to-desktop.  Therefore, it if using both these recipes at once it is recommended that you combine the required changes into a single file and update the recipe files to use that version.  Ultimately I will change both of these recipes to edit or combine these files automatically so there isn't a conflict.

</font>

##How to use##
<font color = GREEN>
<p>
</font>

##Ingredients##
The ingredient files should be placed in the following location on the NOOBS RECOVERY partition:<p>

<font color = GREEN>
<code>pi-kitchen/016-display-switcher</code><p>
</font>

This recipe uses the following files:<p>
<font color = GREEN>
bin/display_switcher.py<p>bin/videomode.py<p>etc/inittab<p><p>
</font>


You can download all the <a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/016-display-switcher_INGREDIENTS.zip">ingredient files</a>, and extracted directly to the NOOBS SD-Card (ensuring you remove the ZIP file's name from the directory - the files should be extracted to <code>pi-kitchen/016-display-switcher</code>).<p>

##The Recipe Files##
Each recipe will use one file for each of the partitions it installs to - boot, root and data).<p>


You will need to suitably rename or copy the content of each of the following files into your recipe files (i.e. <code>RaspbianPiKitchen_root.txt</code>) and place them in your os folder in the NOOBS partition (i.e. <code>os/Raspbian</code>).<p>

For more information see the <a href="http://pihw.wordpress.com/guides/pi-kitchen/creatingflavours">Pi-Kitchen: Creating Flavours</a> guide.<p>


<i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/016-display-switcher/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b>
<pre>
#
#Recipe: 016-display-switcher
#- Add script to bin folder and replace inittab
#../../pi-kitchen/016-display-switcher/bin/display_switcher.sh /home/pi/bin +x
../../pi-kitchen/016-display-switcher/bin/display_switcher.py /home/pi/bin +x
../../pi-kitchen/016-display-switcher/etc/inittab /etc 644 root root
</pre>



<hr>

Enjoy baking your Raspberry Pi SD-Card fresh from the Pi-Kitchen.<p>

<!--========================END FILE================-->
