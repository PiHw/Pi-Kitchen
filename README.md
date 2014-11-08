<img src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/pihwlogotm.png" width=180 />
------------
<img src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchen.png" width=400 />

#Welcome to the Pi-Kitchen#

> Have you created that perfect setup on your Raspberry Pi and then needed to update or reinstall your card?
> 
> Ever wanted to share your creations with others without having to go through all the trouble-shooting that typically comes with it?
> 
> Would you like to be able to use the same setup over and over without needing to clone SD-Cards?
> 
> Do you want your Raspberry Pi SD-Card experience to just be simpler right from the start?

***Well, welcome and come into the Pi-Kitchen!***

The aim of the Pi-Kitchen is to provide a new way to customise and build your SD-Card even before you power up your Raspberry Pi.  It should allow you to bake your own bespoke installation which is ready to go right off the first power up, up to date and fully loaded with whatever you desire.


##The Pi-Kitchen Concept##
The overall concept for using the Pi-Kitchen is to provide a wide selection of "**ingredients**" from which you can select and include in your very own special "**recipe**" for your own perfect SD-Card.

In theory, you will be able to mix and combine the various ingredients (=a particular feature/setup) with other ingredients, to create that perfect blend of special spices to go into your recipe (=your desired setup).

The key difference to the standard method of building custom images is the that source files (the ingredients) are kept separate to the installation (the recipe).  This means we are free to mix and combine them how we wish.

Since NOOBS supports the installation of flavours we can (if we want to) create a range of flavours each using a different recipe, all drawing from a common set of ingredients.

The Pi-Kitchen works using standard files making it easy to edit, adjust and re-configure your setup (even from OSX/Windows or directly from your Raspberry Pi).  Of course once you are happy, you can also tar-ball (compress) everything as desired into a single package.


##How does it work?##
The Pi-Kitchen uses a small modification to the scripts used by NOOBS to perform an additional step in the installation process, allowing us to inject our own files into the final installation (without having to edit the standard images or create custom flavour images).

In the most basic setup, we replace one file in the standard NOOBS install, and then just add the files we need.

###With thanks to...###
A huge thanks to **Kevin Hill** who created <a href="https://github.com/procount/noobsconfig">NOOBS-config</a> which performs the magic, and has kept modifying it to fit in with my ideas/plans for it.

Also thanks also goes to the NOOBS team (**Andrew Scheller** etc) who created <a href="https://github.com/raspberrypi/noobs">NOOBS</a> in the first place.

> <img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/note.png" height=40/>
> **NOTE:** We do allow the Pi-Kitchen to break the golden NOOBS rule about not messing with the recovery partition (and in some cases we are actively encouraging it) so these methods will probably remain outside of the standard NOOBS system.

##What can the Pi-Kitchen do?##
By using this very simple idea, we can perform lots of exceedingly useful operations:

-  Injection of network and WiFi settings so we can have full networking and remote access enabled immediately.
-  Automatically enable the settings for a direct network cable link to use the Raspberry Pi with a laptop/PC
-  An automated install script which we can trigger on the first power up of the Raspberry Pi following the NOOBS installation (so we can install SAMBA, VNC etc as needed)
-  Enable a bluetooth keyboard to work on the first boot
-  Automatically run background scripts to check for and respond to attached hardware (such as hardware buttons)
-  Build stand-alone projects which can be quickly deployed by selecting a specific OS flavour
-  Possibility to setup scripts which automatically run on start up
-  Option to setup mapping of data and recovery partitions automatically
-  We can create a range of different flavours which then can install a unique combination of ingredients (=a particular feature/setup). For example, you could create one flavour for a workshop and another flavour which runs an automated demonstration of the workshop as soon as it is switched on
-  Create installations which can be run without a network but can be easily updated when required.
-  Pre-load the installation with relevant data-sheets, resource materials or web-links.
-  Ability to share and develop common ingredients with others.
-  and probably a lot more we've not tried!
 
 The bonus is, that once you have got something setup and working, you don't need to keep doing it each time you create a new installation or perform clean install.

##Get baking!##
Take a look in the subsections for examples and ideas, and bake your first SD-Card.