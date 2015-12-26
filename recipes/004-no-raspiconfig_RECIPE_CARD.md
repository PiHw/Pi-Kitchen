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
<h1>004 : No Rasp-Config</h1>
</font>

<table style="width:35%" align="right" >
  <tr>
    <th bgcolor=black><font color=white>Recipe Files</th>
    <th bgcolor=black><font color=white>Ingredients</th>
  </tr>
  <tr>
    <td>
              <i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/004-no-raspiconfig/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b><p>
            </td>		
    <td><i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/004-no-raspiconfig_INGREDIENTS.zip">004-no-raspiconfig_INGREDIENTS.zip</a></i></b></td>
  </tr>
    <tr>
    <td>
      <i><b>Tested: Testing in progress</i></b>
    </td>
  </tr>
  </table>


<br>


##Description##
<font color = GREEN>
The standard NOOBS install also triggers a program called `raspi-config` to run on the first boot of the operating system.

Although this program contains many useful settings, we can now apply our own settings using the Pi-Kitchen so we do not need this.  

Particularly important is if we create an automatic installation, we may not even have a keyboard or display attached.  Therefore, `raspi-config` may cause an issue on the first boot, as it will sit there waiting for user input rather than continuing with our own startup/installation scripts.

><img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/note.png" height=40/><b>NOTE:</b> If you do want to run `raspi-config` at a later point, you can, just use the command `sudo raspi-config`.

##Stopping `raspi-config` running##
We can stop `raspi-config` running by replacing the script which normally runs it with an alternative.

The recipe will replace `etc/profile.d/raspi-config.sh` which doesn't include the call to `raspi-config`.

##Performing post `raspi-config` steps##
Once `raspi-config` runs (located at `/usr/bin/raspi-config`), it performs two actions:

1. It deletes the `etc/profile.d/raspi-config.sh` script (we don't need to do this since our version doesn't run `raspi-config`).
2. It modifies `etc/inittab`.

The `etc/inittab` file **before** `raspi-config`:
`#1:2345:respawn:/sbin/getty --noclear 38400 tty1 # RPICFG_TO_ENABLE`
`1:2345:respawn:/bin/login -f root tty1 </dev/tty1 >/dev/tty1 2>&1 # RPICFG_TO_DISABLE`

The `etc/inittab` file **after** `raspi-config`:
`1:2345:respawn:/sbin/getty --noclear 38400 tty1 # RPICFG_TO_ENABLE`
`#1:2345:respawn:/bin/login -f root tty1 </dev/tty1 >/dev/tty1 2>&1 # RPICFG_TO_DISABLE`

Within `raspi-config` the program performs the following actions:

	disable_raspi_config_at_boot() {
	  if [ -e /etc/profile.d/raspi-config.sh ]; then
	    rm -f /etc/profile.d/raspi-config.sh
	    sed -i /etc/inittab 
	      -e "s/^#(.*)#s*RPICFG_TO_ENABLEs*/1/" 
	      -e "/#s*RPICFG_TO_DISABLE/d"
	    telinit q
	  fi
	}

Additionally, we have to set the environment variable `TERM` (for some reason this is not set if `raspi-config` is not run on start up).  If not then programs will not run correctly from the command line:

`Error Opening Terminal: Unknown`

`tput: No value for $TERM and no -T specified`

This only happens when connected to a local screen - remote connections do not have a problem (hence I did not notice until I used a HDMI screen).

Therefore we add the following to `etc/profile.d/raspi-config.sh` to fix this:

`TERM=xterm`

><img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/warn.png" height=40/><b>WARNING:</b> Although this recipe does work, there are still parts which I am not happy with.  The terminal is fine for remote connections, but the local (via a screen) has `pi@raspberrypi` added to the terminal name.  However it does the job and allows the start-up scripts to run.  This recipe will be updated when I've fixed it.</font>


##Ingredients##
The ingredient files should be placed in the following location on the NOOBS RECOVERY partition:<p>

<font color = GREEN>
<code>pi-kitchen/004-no-raspiconfig</code><p>
</font>

This recipe uses the following files:<p>
<font color = GREEN>
etc/inittab<p> etc/profile.d/raspi-config.sh<p><p>
</font>


You can download all the <a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/004-no-raspiconfig_INGREDIENTS.zip">ingredient files</a>, and extracted directly to the NOOBS SD-Card (ensuring you remove the ZIP file's name from the directory - the files should be extracted to <code>pi-kitchen/004-no-raspiconfig</code>).<p>

##The Recipe Files##
Each recipe will use one file for each of the partitions it installs to - boot, root and data).<p>


You will need to suitably rename or copy the content of each of the following files into your recipe files (i.e. <code>RaspbianPiKitchen_root.txt</code>) and place them in your os folder in the NOOBS partition (i.e. <code>os/Raspbian</code>).<p>

For more information see the <a href="http://pihw.wordpress.com/guides/pi-kitchen/creatingflavours">Pi-Kitchen: Creating Flavours</a> guide.<p>


<i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/004-no-raspiconfig/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b>
<pre>
#
#Recipe: 004-no-raspiconfig
#- Stop raspi-config being run on first boot by replacing the defaults file
../../pi-kitchen/004-no-raspiconfig/etc/profile.d/raspi-config.sh /etc/profile.d # root root
../../pi-kitchen/004-no-raspiconfig/etc/inittab /etc 644 root root</pre>



<hr>

Enjoy baking your Raspberry Pi SD-Card fresh from the Pi-Kitchen.<p>

<!--========================END FILE================-->
