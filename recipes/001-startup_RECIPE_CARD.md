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
<h1>001 : Start Up - Run Once Install </h1>
</font>

<table style="width:35%" align="right" >
  <tr>
    <th bgcolor=black><font color=white>Recipe Files</th>
    <th bgcolor=black><font color=white>Ingredients</th>
  </tr>
  <tr>
    <td>
              <i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/001-startup/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b><p>
            </td>		
    <td><i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/001-startup_INGREDIENTS.zip">001-startup_INGREDIENTS.zip</a></i></b></td>
  </tr>
    <tr>
    <td>
      <i><b>Tested: Raspbian</i></b>
    </td>
  </tr>
  </table>


<br>


##Description##
<font color = GREEN>
This startup recipe forms the foundation for many of the other recipes used in the Pi-Kitchen.

The recipe provides the following features (which will be used by other recipes):

- easy access to the Recovery and Data partitions by mounting them on power up

- a mechanism to perform automatic installations as part of the first post-NOOBS install power up

- a method to perform scripted installations at a later point (i.e. for instance when user input or network is required)

- adds convenient locations from which scripts can automatically be executed on power up (including as background processes)</p>

#What does it do?#

This recipe works by modifying the <code>local.rc</code> file to do two additional steps on power up:

**Step 1:** Automount the Recovery partition and the Data partition (if present) as local directories in the Pi user's home:

<code>/home/pi/recovery</code>

<code>/home/pi/data</code>

As we will see later, by mounting the Recovery partition we have easy access to the files on the 1st partition of the SD-Card.  This is important since this is the only partition which we can access directly from a Windows computer.

By allowing access to this partition:

- It is a lot easier to transfer files back and forth from a windows PC or laptop.

- We can modify our Pi-Kitchen setup from the Raspberry Pi itself.

> <img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/warn.png" height=40/>
>**Warning**: The Recovery partition is the partition used by NOOBS, therefore this also provides a means to break NOOBS (i.e. by deleting files or through corruption if there is a power fail while writing to it).  Therefore, this aspect of the recipe does go against the NOOBS &quot;golden rule&quot;, that the Raspberry Pi should never interfere with the NOOBS partition.

As we shall show, there are advantages to bending this rule so it is up to you.  If you want to avoid mounting the recovery partition feel free to remove these steps from your own recipe, and adjust any scripts which use the <code>/home/pi/recovery</code> directory.

**Step 2:** Runs <code>/home/pi/bin/startup.sh</code>:

The <code>startup.sh</code> script is our key file for the special features provided in the rest of this recipe, its purpose is to trigger our custom tasks when the Raspberry Pi starts.

#The purpose of <code>startup.sh</code>#

The <code>startup.sh</code> script works by processing scripts which are placed in special locations, depending upon the location it will do different things.

##The Runonce Directory##

Located at <code>/home/pi/bin/_RUNONCE</code> the <code>startup.sh</code> script will run any scripts (in alphabetical order) which are located here on the first power up of the Raspberry Pi following a new install.

The recipe also places <code>runonce-end.sh</code> in this folder, which will swap the initial verison of <code>startup.sh</code> (a special version which causes the <code>_RUNONCE</code> scripts to run) with <code>startup_normal.sh</code> (a version which doesn't run the <code>_RUNONCE</code> scripts).  This allows these scripts to be run once only.

It is intended that any one off installation or configuration scripts are placed in this folder, so that they can be automatically run the first time you start your Raspberry Pi.  All the scripts put here should run without user interaction, so they can be run with or without a screen/keyboard attached (see **The Installonce Directory** for installations which need user input).

You can also place a script here to automatically perform a shutdown of the Raspberry Pi (so you can power off safely when the installation has completed), to restart (to ensure new settings have been applied) or perhaps activate some hardware to indicate when your Pi has finished "cooking".

###The `zzz-reboot.sh` and `zzz-shutdown.sh` scripts###
You can optionally add either of these scripts to the **Runonce** directory so that when all the other scripts have run (they are run alphabetically) the Raspberry Pi will be rebooted or shutdown.

##The Runstart Directory##

Located at <code>/home/pi/bin/_RUNSTART</code> and also <code>/home/pi/recovery/_USER/_RUNSTART</code> (physically located on the Recovery partition of the SD-Card, which is accessible from windows).

The <code>startup.sh</code> script will run any scripts placed in either of these directories (the SD-Card scripts are run after the local ones).    You should avoid placing any scripts here which don't finish on their own (i.e. have a continuous loop) or wait for input unless that is intended (for a start up menu system or dedicated demonstration).

##The Runstart Background Directory##

Located at <code>/home/pi/bin/_RUNSTARTBG</code> and also <code>/home/pi/recovery/_USER/_RUNSTARTBG</code> (physically located on the Recovery partition of the SD-Card, which is accessible from windows).

Just like the standard Runstart directory, the <code>startup.sh</code> script will run these scripts, but will do so as a background process.  This is an easy way to run scripts without waiting for them to complete.  This allows you to monitor for GPIO inputs, run backups or use LEDs as indicators, for example.

##The purpose of <code>installonce.sh</code>##

The <code>installonce.sh</code> script, will not be run automatically, but should be run by the user at a later point.  As like the other directories, any scripts placed within <code>/home/pi/bin/_INSTALLONCE</code> will be run.

This will allow a set of installations or settings to be configured following the initial installation.

By deferring these scripts to a later point, we can ensure that the user has the means to control the Raspberry Pi, be it directly with a connected screen and keyboard or through a remote connection.  We can also perform installs which may require network connections (which we may have not needed when performing the NOOBS installation), or use Wifi connections (which might require additional setup), we can even have an option to install packages from a local source.  We can prompt the user to enter passwords and custom settings which we may not want to store within the Recovery partition.

</font>

##How to use##
<font color = GREEN>
Place any scripts required in the _RUNONCE, _RUNSTART and _RUNSTARTBG directories.<p>
</font>

##Ingredients##
The ingredient files should be placed in the following location on the NOOBS RECOVERY partition:<p>

<font color = GREEN>
<code>pi-kitchen/001-startup</code><p>
</font>

This recipe uses the following files:<p>
<font color = GREEN>
_RUNONCE/runonce-end.sh<p> _RUNONCE/zzz-reboot.sh<p> _RUNONCE/zzz-shutdown.sh<p> bin/installonce.sh<p> bin/runonce.sh<p> bin/runstart.sh<p> bin/runstartbg.sh<p> bin/startup.sh<p> bin/startup_normal.sh<p> etc/rc.local<p> dummydir.txt<p><p>
</font>


You can download all the <a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/001-startup_INGREDIENTS.zip">ingredient files</a>, and extracted directly to the NOOBS SD-Card (ensuring you remove the ZIP file's name from the directory - the files should be extracted to <code>pi-kitchen/001-startup</code>).<p>

##The Recipe Files##
Each recipe will use one file for each of the partitions it installs to - boot, root and data).<p>


You will need to suitably rename or copy the content of each of the following files into your recipe files (i.e. <code>RaspbianPiKitchen_root.txt</code>) and place them in your os folder in the NOOBS partition (i.e. <code>os/Raspbian</code>).<p>

For more information see the <a href="http://pihw.wordpress.com/guides/pi-kitchen/creatingflavours">Pi-Kitchen: Creating Flavours</a> guide.<p>


<i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/001-startup/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b>
<pre>
#
#Recipe: 001-startup
#Setup rc.local startup script
../../pi-kitchen/001-startup/etc/rc.local /etc +x root root
#- Mount recovery and userdata
../../pi-kitchen/001-startup/dummydir.txt /home/pi/recovery
../../pi-kitchen/001-startup/dummydir.txt /home/pi/userdata
#- Create _RUNSTART, _RUNSTARTBG, _RUNONCE and _INSTALLONCE directories
../../pi-kitchen/001-startup/dummydir.txt /home/pi/bin/_RUNSTART
../../pi-kitchen/001-startup/dummydir.txt /home/pi/bin/_RUNSTARTBG
../../pi-kitchen/001-startup/dummydir.txt /home/pi/bin/_RUNONCE
../../pi-kitchen/001-startup/dummydir.txt /home/pi/bin/_INSTALLONCE
#- Setup startup.sh, runstart.sh, runstartbg.sh, runonce.sh and installonce.sh scripts
../../pi-kitchen/001-startup/bin/startup_normal.sh /home/pi/bin
../../pi-kitchen/001-startup/bin/startup.sh /home/pi/bin
../../pi-kitchen/001-startup/bin/runstart.sh /home/pi/bin
../../pi-kitchen/001-startup/bin/runstartbg.sh /home/pi/bin
../../pi-kitchen/001-startup/bin/runonce.sh /home/pi/bin
../../pi-kitchen/001-startup/_RUNONCE/runonce-end.sh /home/pi/bin/_RUNONCE
../../pi-kitchen/001-startup/bin/installonce.sh /home/pi/bin
../../pi-kitchen/001-startup/bin/insert_line.sh /home/pi/bin
#- Add automatic REBOOT or SHUTDOWN script at end of runonce sequence (optional)
../../pi-kitchen/001-startup/_RUNONCE/zzz-reboot.sh /home/pi/bin/_RUNONCE
#../../pi-kitchen/001-startup/_RUNONCE/zzz-shutdown.sh /home/pi/bin/_RUNONCE
#-Add apply_flavour script to allow manual switching between flavour setups
../../pi-kitchen/001-startup/bin/apply_flavour.sh /home/pi/bin
</pre>



<hr>

Enjoy baking your Raspberry Pi SD-Card fresh from the Pi-Kitchen.<p>

<!--========================END FILE================-->
