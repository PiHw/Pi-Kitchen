
<img src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/pihwlogotm.png" width=180 />
----------
<img src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchen.png" width=150 />

#Pi-Kitchen: Creating Flavours#

Perform the initial setup of NOOBS and noobsconfig as described in the <a href="https://github.com/PiHw/Pi-Kitchen/blob/master/markdown_source/markdown/PiKitchen-GettingStarted.md">Pi-Kitchen - Getting Started</a> guide.

> <img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/idea.png" height=40/>
>**Idea**: Once you have completed this guide, you will create and add the following set of files to the top level of the SD-Card (you can check your files match the contents of the zip file if you get stuck):

> <a href="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/guides/CreatingFlavours.zip">***CreatingFlavours.zip***</a>


##Adding some flavour##
Once you have got the basics working with noobsconfig it is worth creating some flavour's to experiment with.  This will allow you to keep the all default installs just as nature (the NOOBS team) intended and experiment with your own flavours separately.

###What is a flavour?###
A flavour is a variation of a particular distribution, for example the `Raspbian Boot to Scratch` option in NOOBS.  It will install all the normal files for the Raspbian distribution and then based on the flavour name, shall install or customise the install as required for the particular flavour.

> <img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/note.png" height=40/>
>**Note**: NOOBS does support the kind of customisations we are achieving by using noobsconfig.  However NOOBS does it through the standard flavours mechanism, where all the customisations need to be carefully packaged within the Raspbian image files and added to the internal scripts.
>
>As you will see it is a lot simpler using noobsconfig, since we do not need to package anything and we do not need to change the distro's image files (so we can apply the same changes to an updated system by replacing the distro images).

###Adding your own flavours###
As you progress and experiment, you may want to create a golden flavour install (which contains your standard setup) and add additional flavours for things you are trying out/working on.  Again, this allows you to keep things running, as you will find if you structure your files correctly you can quickly transfer your setups to and from your various flavours.

Adding a flavour is easy...locate the `flavours.json` file in the `os/Raspbian` directory (or equivalent for your selected distribution).

<a href="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/guides/CreatingFlavours/os/Raspbian/flavours.json">***flavours.json***</a>

	{
	  "flavours": [
	    {
	      "name": "RaspbianPiKitchen",
	      "description": "Freshly baked Raspbian from the Pi-Kitchen"
	    },
	    {
	      "name": "RaspbianPiKitchenDev",
	      "description": "A Pi-Kitchen creation under development"
	    },
	    {
	      "name": "Raspbian - Boot to Scratch",
	      "description": "A version of Raspbian that boots straight into Scratch"
	    },
	    {
	      "name": "Raspbian",
	      "description": "A Debian wheezy port, optimised for the Raspberry Pi"
	    }  
	  ]
	}

You can see above we have added an extra entry with the **name** `"RaspbianPiKitchen"` and a suitable **description** to go with it, this will be our golden install.  We have also added a development version called `"RaspbianPiKitchenDev"` so we can experiment with other recipes.

Both of these new flavours will be displayed in the NOOBS installation menu and the names will used by the recipe files.

###Rename your recipe file###
In order for a particular flavour to use noobsconfig we also need to create a recipe file, in this example the `"RaspbianPiKitchen"` filenames will be as follows:

<a href="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/guides/CreatingFlavours/os/Raspbian/RaspbianPiKitchen_boot.txt">***RaspbianPiKitchen_boot.txt***</a>

<a href="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/guides/CreatingFlavours/os/Raspbian/RaspbianPiKitchen_root.txt">***RaspbianPiKitchen_root.txt***</a>

Remember if you copy the recipe files from the previous <a href="https://github.com/PiHw/Pi-Kitchen/blob/master/markdown_source/markdown/PiKitchen-GettingStarted.md">Pi-Kitchen - Getting Started</a> example, they also refer to the filenames of each recipe file inside.

###The distribution icon file###
It is helpful to use a distinctive icon for your flavour, which will be displayed in the NOOBS installation menu and allow you to locate it even when using a low resolution screen.  The distribution icon file must be named the same as the distribution or flavour you are using, as listed in the `flavours.json` file (i.e. `Raspbian.png`, `RaspbianPiKitchen.png` or `RaspbianPiKitchenDev.png`) and located in the directory for the distribution (i.e. `os/Raspbian`).

> <img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/note.png" height=40/>
>**Note**: If the flavour or distribution name has spaces, be sure to replace any spaces with "`_`" characters i.e. `Raspbian_-_Boot_to_Scratch.png`.

Download the icon file for the `"RaspbianPiKitchen"` and `"RaspbianPiKitchenDev"` flavours below and place in the `os/Raspbian` directory:
<img src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/guides/CreatingFlavours/os/Raspbian/RaspbianPiKitchen.png" height=40/>
<a href="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/guides/CreatingFlavours/os/Raspbian/RaspbianPiKitchen.png">RaspbianPiKitchen.png</a>
<p>
<img src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/guides/CreatingFlavours/os/Raspbian/RaspbianPiKitchenDev.png" height=40/>
<a href="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/guides/CreatingFlavours/os/Raspbian/RaspbianPiKitchenDev.png">RaspbianPiKitchenDev.png</a>

###Extending the installation slides###
When using NOOBS previously, you may have noticed various tips and information are normally displayed during the installation of the OS.

If we want to we can add our own, these can provide additional tips and information which may be useful for those using your setups, reminders of useful information or simply something more interesting while you are waiting.

The slides are stored in a sub-folder of the distribution folder called `slides_vga` (i.e. `os/Raspbian/slides_vga`) and are named alphabetically (i.e. A.png, B.png etc.).  The slides themselves are PNG format files, 387 pixels wide by 290 pixels high.  To make your own, simply make a copy and replace with your own content, adding the slide as the next letter.

A pack of additional <a href="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/guides/CreatingFlavours/pihw-slides.zip">Pi-Hardware slides</a> are available, just download and extract them into the `os/Raspbian/slides_vga` folder (A to G are the standard ones).

<!--- #ifdef NOT_WORKING --->
<!--
> <img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/note.png" height=40/>
>**Note**: If you want the same set of slides to appear for every distribution, remove any `os/DISTRO/slides_vga` folders and place your set of slides in the `default/slides` instead.
-->
<!--- #endif --->

###The flavour taste test###
Once you have:

1. Updated the `flavours.json` file
2. Created suitably named **recipe** files for each partition
3. Provided a **distribution icon**
4. Extended the **installation slides**

Ensure you have transferred your new changes to your SD-Card.

You are ready to test the new setup.

> <img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/note.png" height=40/>
>**Note**: If you have previously installed a distribution using NOOBS, it will not run automatically (it will boot into the existing installation).  You can start NOOBS by holding `SHIFT` (actually tapping `SHIFT` over and over seems to work best) when you power up, or you can adjust the `recovery.cmdline` file (again use an editor like Notepad++ which will keep the UNIX format).
>
> You will need to add `runinstaller` at the start of the command line (this is automatically removed by NOOBS once an installation has been completed).
> 
> <a href="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/guides/CreatingFlavours/recovery.cmdline">***recovery.cmdline***</a>
> 
	runinstaller quiet vt.cur_default=1 coherent_pool=6M elevator=deadline
>
> Just remember that if you install a distribution it will remove all the partitions (and you will lose any data you have added since), except of course anything in the NOOBS partition.

When you run NOOBS you should find your new flavour listed alongside all the others, and as before when you install it the recipe files will be copied into the correct locations (and you should be treated to a new slide-show!

###What's next?###
We have shown how to create additional flavours and to customise them how we want, now we are ready to start putting this to some good use.

The remaining guides will show how we can use various techniques to <a href="https://http://pihw.wordpress.com/guides/pi-kitchen/automaticinstallations/">automatically</a> get our systems setup as we desire (and avoid all the manual messing around that comes with a typical new installation).

Use the examples provided in the guides to help you build up your recipe files, you'll find you can mix and match most recipes (just check which files are being updated to see if there are duplicates).
