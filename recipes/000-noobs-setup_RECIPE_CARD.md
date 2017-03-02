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
<h1>000 : NOOBS Setup</h1>
</font>

<table style="width:35%" align="right" >
  <tr>
    <th bgcolor=black><font color=white>Recipe Files</th>
    <th bgcolor=black><font color=white>Ingredients</th>
  </tr>
  <tr>
    <td>
              <i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/000-noobs-setup/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b><p>
            </td>		
    <td><i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/000-noobs-setup_INGREDIENTS.zip">000-noobs-setup_INGREDIENTS.zip</a></i></b></td>
  </tr>
    <tr>
    <td>
      <i><b>Tested: Inprogress</i></b>
    </td>
  </tr>
  </table>


<br>


##Description##
<font color = GREEN>
This recipe has two functions:
1 - When setting up a Pi-Kitchen SD-Card this recipe includes `switchnoobs.bat` which will allow a Windows based PC to switch between the NOOBS/PINN setups.  It also includes the functionality to build a specific flavour recipe file, using `build_flavourRecipe.bat`.

2 - When installed on a Raspberry Pi, `switchnoobs.sh` is added to the `pi/bin` directory, allowing easy switching of the NOOBS setup from the Raspberry Pi itself.
HOWEVER - This has not been kept up to date so will need adjustments to function correctly.

><img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/warn.png" height=40/>
**WARNING:** If you have altered the `flavours.json` file to add your own custom flavours then you **must** add a new .json file within the `_flavours` directory for your flavour:

>`Raspbian.json`
>`RaspbianBootToScratch.json`
>`RaspbianPiKitchen.json`
>`RaspbianPiKitchenDev.json`

This should look similar to the following:
<code>
      "name": "RaspbianPiKitchen",
      "description": "Freshly baked Raspbian from the Pi-Kitchen"
</code>

Plus any custom icon files for the flavours:
>`RaspbianPiKitchen.png`
>`RaspbianPiKitchenDev.png`


>Also if you have changed the `partitions.json` file or added your own content to `data.tar.xz` you will need to update these files.
>`partitions.json`
>`data.tar.xz`

>These will be used to replace the active ones when switching between setups.  If you make any changes to these files in the distribution folder, ensure you update these ones too.
>
>Note: NOOBS and PINN have different versions of this file so each version is kept under `/noobs/_partitions` and `/_pinn/_partitions`.

The NOOBS and PINN also have different versions of `recovery.cmdline`, so these are kept under `noobs/_cmdline` and `pinn/_cmdline` for `auto`, `gui` and `normal` start modes.

##Easy Pi-Kitchen setup##
This recipe also provides a quick way to setup the additional flavours (as described in the <a href="http://pihw.wordpress.com/guides/pi-kitchen/creatingflavours/">Pi-Kitchen Guide: Creating Flavours</a>).

It performs the following actions (when a GUI / Normal installation is selected):

- Sets `recovery.cmdline` to run the GUI / Normal (run shift is pressed during startup).

- Regenerates the `flavours.json` file with any additional flavours listed in the `_flavours` folder (such as `RaspbianPiKitchen` and `RaspbianPiKitchenDev`) places it into the `os/Raspbian` folder.

- Copies over the custom icons (if not already present).

<img style="float:left" src="_flavours/RaspbianPiKitchen.png" height=40/>
<img style="float:left" src="_flavours/RaspbianPiKitchenDev.png" height=40/>

- Enables the data partition as part of the installation (replacing `partitions.json` and adding `data.tar.xz` (if not already present)).

><img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/note.png" height=40/>
**NOTE:** This does not install noobsconfig, the NOOBS system or any recipe files.

To complete the **Multi-flavour setup** as described in <a href="http://pihw.wordpress.com/guides/pi-kitchen/quickstart/">Pi-Kitchen Guide: Quick Start</a>) you will need to:

1. Extract [noobsconfig](https://github.com/procount/noobsconfig/blob/master/noobsconfig.zip?raw=true)

2. Add your own `boot/root/data` recipe files.

##Automatic Installations##
As explained in the <a href="http://pihw.wordpress.com/guides/pi-kitchen/automaticinstallations/">Pi-Kitchen Guide: Automatic Installations</a> there are a number of steps required in order to allow NOOBS to perform an automated (also known as headless - since a display isn't required).

- Sets `recovery.cmdline` to run silent NOOBS/PINN install (no user interaction is required).

- Replaces the `flavours.json` file with one generated using just the selected flavour.

- Disables the other distributions by renaming the `os.json` files.

- Enables the data partition as part of the installation (replacing `partitions.json` and adding `data.tar.xz` (if not already present)).

The `switchnoobs` scripts will perform these actions for you (assuming you have the correct files in the `_flavours` directory).

##GUI Installations##
As mentioned above, by selecting GUI or Normal, the script will set NOOBS to display all the installed distributions and allow manual selection before installation.

##Video Modes##
The configurations supplied allow selection of the video mode used by NOOBS when running the installation.

><img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/note.png" height=40/>
**NOTE:** NOOBS 1.3.10 has a bug which means it ignores the `video` option, so selecting a different video mode using this recipe will not make any difference (it will always use HDMI).  So you will need a keyboard to change the video output manually if using anything other than a HDMI screen.  Later versions of NOOBS should have this bug fixed.

##Adding Additional Flavours/Distros##
The `switchnoobs` scripts can easily be extended to allow selection of other distributions or flavours by using a similar format.  Just add a new `.json` file to the `_flavours` folder and add a new selection to the script.

You could even create a version which doesn't include the data partition (if desired).

><img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/note.png" height=40/>
**NOTE:** There is an open GitHub request on NOOBS which will allow the desired flavour/distribution to be to selected (and automatically installed) directly from the `recovery.cmdline`.  If this implemented, then this will dramatically simplify this recipe.

##Creating your Flavour recipe files##
Included in this recipe is `build_flavourRecipe.bat` which will generate set of a Flavour recipe files:
i.e. For the RaspbianPiKitchen flavour:
`RaspbianPiKitchen_boot.txt`
`RaspbianPiKitchen_data.txt`
`RaspbianPiKitchen_root.txt`

By default this script will use the `recipelist.txt` file (which you can regenerate using `gen_recipelist.bat`:

<code>
#Ignore any recipes with # at the start of the line 
000-noobs-setup
001-startup
002-bootdisplay
#003-direct-network
004-no-raspiconfig
005-wifi
006-wifi-driver
007-network-share
008-vnc
009-map-network-share
010-scratch-gpio
011-boot-to-desktop
</code>

Simply list all the recipes you want to include in your flavour and comment out (using #) any you don't want.

The `build_flavourRecipe.bat` also supports two additional ways to customise your flavour recipe files.

1. You can create **flavour specific recipe lists** by using the flavour name `<flavour>_recipelist.txt`:

i.e. `RaspbianPiKitchen_recipelist.txt`

><img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/tip.png" height=40/>
>**TIP:** This allows you to include different recipes in different flavours!

2. You can create **flavour specific recipe files** (the recipe files located in each particular recipe) again by using the flavour name.  If a flavour specific recipe file isn't present it will use the default one `RECIPE_FILE_boot.txt` instead.

i.e. `RaspbianPiKitchen_RECIPE_FILE_boot.txt`

><img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/tip.png" height=40/>
>**TIP:** This allows you to create recipe variations for a particular flavour (i.e. using different Wifi settings or default displays).

##Support for NOOBS v1.5.0##
###recovery.cmdline###
Since the release of **NOOBS v1.5.0** the `recovery.cmdline` file was changed.

For **NOOBS v1.4.2 and before** the `recovery.cmdline` file is:
<pre>quiet vt.cur_default=1 coherent_pool=6M elevator=deadline</pre>

For **NOOBS v1.5.0 and later** the `recovery.cmdline` file is:
<pre>runinstaller quiet ramdisk_size=32768 root=/dev/ram0 init=/init vt.cur_default=1 elevator=deadline</pre>

###partions.json###
The partitions have also been adjusted for **NOOBS v1.5.0**.

For **NOOBS v1.4.2 and before**:
<pre>
  "partitions": [
    {
      "label": "boot",
      "filesystem_type": "FAT",
      "partition_size_nominal": 60,
      "want_maximised": false,
      "uncompressed_tarball_size": 11,
      "mkfs_options": "-F 32"
    },
    {
      "label": "root",
      "filesystem_type": "ext4",
      "partition_size_nominal": 2700,
      "want_maximised": true,
      "mkfs_options": "-O ^huge_file",
      "uncompressed_tarball_size": 2203
    },
</pre>

For **NOOBS v1.5.0 and later**:
<pre>
  "partitions": [
    {
      "label": "boot",
      "filesystem_type": "FAT",
      "partition_size_nominal": 63,
      "want_maximised": false,
      "uncompressed_tarball_size": 21
    },
    {
      "label": "root",
      "filesystem_type": "ext4",
      "partition_size_nominal": 3482,
      "want_maximised": true,
      "mkfs_options": "-O ^huge_file",
      "uncompressed_tarball_size": 3082
    }
  ]
</pre></font>

##How to use##
<font color = GREEN>
Change the NOOBS setup by running <code>sudo ./bin/switchnoobs.sh</code><p>
</font>

##Ingredients##
The ingredient files should be placed in the following location on the NOOBS RECOVERY partition:<p>

<font color = GREEN>
<code>pi-kitchen/000-noobs-setup</code><p>
</font>

This recipe uses the following files:<p>
<font color = GREEN>
switchnoobs.sh<p> autorecovery.cmdline<p> installrecovery.cmdline<p> install-sdtvrecovery.cmdline<p> auto-sdtvrecovery.cmdline<p> normalrecovery.cmdline<p> _flavoursflavours.json.normal<p> _flavoursflavours.json.auto<p> _flavoursflavours.json.autodev<p> _flavoursRaspbianPiKitchenDev.png<p> _flavoursRaspbianPiKitchen.png<p><p>
</font>


You can download all the <a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/000-noobs-setup_INGREDIENTS.zip">ingredient files</a>, and extracted directly to the NOOBS SD-Card (ensuring you remove the ZIP file's name from the directory - the files should be extracted to <code>pi-kitchen/000-noobs-setup</code>).<p>

##The Recipe Files##
Each recipe will use one file for each of the partitions it installs to - boot, root and data).<p>


You will need to suitably rename or copy the content of each of the following files into your recipe files (i.e. <code>RaspbianPiKitchen_root.txt</code>) and place them in your os folder in the NOOBS partition (i.e. <code>os/Raspbian</code>).<p>

For more information see the <a href="http://pihw.wordpress.com/guides/pi-kitchen/creatingflavours">Pi-Kitchen: Creating Flavours</a> guide.<p>


<i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/000-noobs-setup/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b>
<pre>
#
#Recipe: 000-noobs-setup
#Add switchnoobs files:
#- switchnoobs.sh should be set as executable
../../pi-kitchen/000-noobs-setup/switchnoobs.sh /home/pi/bin +x</pre>



<hr>

Enjoy baking your Raspberry Pi SD-Card fresh from the Pi-Kitchen.<p>

<!--========================END FILE================-->
