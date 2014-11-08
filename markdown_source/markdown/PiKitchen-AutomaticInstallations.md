
<img src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/pihwlogotm.png" width=180 />
----------
<img src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchen.png" width=150 />

#Pi-Kitchen: Automatic Installations#

The NOOBS system supports automated installations, and this functionality works nicely with noobsconfig.

> <img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/idea.png" height=40/>
>**Idea**: Once you have completed this guide, you will create and add the following set of files to the top level of the SD-Card (you can check your files match the contents of the zip file if you get stuck):

> <a href="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/guides/AutomaticInstallation.zip">***AutomaticInstallation.zip***</a>

> <a href="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/guides/AutomaticInstallationWithData.zip">***AutomaticInstallationWithData.zip*** (version with built-in data partition)</a>

##Introduction##

In order for an automated installation to occur (i.e. you can setup your SD-Card without needing to attach a keyboard, mouse or display) you need to remove any unwanted distributions and/or flavours on the card.

> <img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/note.png" height=40/>
> **NOTE:** The current NOOBS installation now only contains Raspbian, so you only need to remove the `os/Data_Partition` folder.
> 
> In fact NOOBS is looking for the `os.json` file so you can just rename this file (i.e. `os.json.removed`) if you want to restore the options later.

This allows NOOBS to assume that the only option available is the desired one and will automatically install it when instructed to do so.

So to install a custom flavour such as the **RaspbianPiKitchen** created in the <a href="https://github.com/PiHw/Pi-Kitchen/blob/master/markdown_source/markdown/PiKitchen-CreatingFlavours.md">Pi-Kitchen: Creating Flavours</a> guide, we need to remove all other `os` directories except `os/Raspbain` and we should edit (or rename the old one and create a new version) the flavours.json file as follows (removing the `"Raspbian - Boot to Scratch"` and pure `"Raspbain"` entries:

<a href="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/guides/AutomaticInstallation/os/Raspbian/flavours.json">***flavours.json***</a>


	{
	  "flavours": [
	    {
	      "name": "RaspbianPiKitchen",
	      "description": "Freshly baked Raspbian from the PiKitchen"
	    }  
	  ]
	}

Remember to use an editor like Notepad++ which will keep the UNIX format!

##Adding a data partition##
Since we need to remove all the other options, this also removes ability to add the data partition.  However, we can add the equivalent of the data partition by editing the **partition.json** file which defines what partitions are created before the distribution.

Again using Notepad++ or similar.

<a href="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/guides/AutomaticInstallationWithData/os/Raspbian/partitions.json">***partition.json***</a>

Add the following after the "boot" and "root" partitions, but before the final `] }` lines:

	,
    {
      "label": "data",
      "filesystem_type": "ext4",
      "partition_size_nominal": 512,
      "want_maximised": false,
      "mkfs_options": "",
      "uncompressed_tarball_size": 1
    }

If we do this we must also copy the `data.tar.xz` file from the `os/Data_Partition` (or <a href="https://github.com/PiHw/Pi-Kitchen/blob/master/guides/AutomaticInstallationWithData/os/Raspbian/data.tar.xz?raw=true">download</a> a copy of it).  By default `data.tar.xz` just contains a basic README.txt.

###Using the data partition with a recipe###
We can also use recipe files with the data partition by creating another file (in this example it should be called `RaspbianPiKitchen_data.txt`).

<a href="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/guides/AutomaticInstallationWithData/os/Raspbian/RaspbianPiKitchen_data.txt">***RaspbianPiKitchen_data.txt***</a>

	#Noobs config file for RaspbianPiKitchen_data (DateOfEdit)
	#------------------------------------------------------
	#Format is: filename destination attributes user group
	
	#Copy the Noobs config txt files to home directory for reference
	RaspbianPiKitchen_boot.txt
	RaspbianPiKitchen_root.txt
	RaspbianPiKitchen_data.txt
	
	#------------------------------------------------------
	#End

##Reset the recovery.cmdline file##
Finally, you will need to adjust the `recovery.cmdline` file (don't forget to use Notepad++ or similar).  You will need to add **slientinstall runinstaller** at the start of the command line.
<p>
<a href="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/guides/AutomaticInstallation/recovery.cmdline">***recovery.cmdline***</a>


	slientinstall runinstaller quiet vt.cur_default=1 coherent_pool=6M elevator=deadline

> <img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Stop/master/markdown_source/markdown/img/note.png" height=40/>
>**Note**: Remember installing a distribution will erase any other installations and files you have elsewhere on the SD-Card!

###What's next?###
Clearly, this method has some excellent advantages in situations where a screen isn't really required or if you want to get the setup done ahead of time (such as a classroom/club setup).  All you need to do is setup the SD-Card and leave it running on a Raspberry Pi while you get the next one ready or do something else more important.

However the real advantage comes if combined with Pi-Kitchen recipes, since we can provide setups with the following preconfigured:

- remote access (X10-Forwarding, VNC)
- special network settings (such as a direct LAN connection setup, SAMBA)
- Wifi dongle configuration (including access point names and passwords)
- Automatic demo scripts for hardware/software demonstrations
- LCD support

So it should be possible to avoid having to attach a screen at all (although be warned, it can be difficult to know when it has finished or what happened if something doesn't go correctly if you don't have a screen available to troubleshoot).

