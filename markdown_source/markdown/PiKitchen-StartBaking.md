<img src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/pihwlogotm.png" width=180 />
------------
<img src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchen.png" width=150 />

#The Pi-Kitchen project#
The Pi-Kitchen is evolving from the manual process of placing files in the correct places to become easier and easier to use (while still retaining the full flexibility it offers).  The first stage of creating an initial collection of recipes is completed (lots more to come!), and now there is a brand new component, the "Bake" scripts.

The scripts are a stepping-stone to the final GUI I have planned for the Pi-Kitchen (this allows me to better understand what will be needed in the GUI and to ensure the system is suitable).

There is still a small amount of manual setup to get started, but it is now fairly minimal with the majority of the "Baking process" automated.


##Preheat the oven - First Bake setup##
The "Bake" scripts will do all the complicated parts for you, so you just need to:

1. Download and extract [Pi-Kitchen from Git-Hub](https://github.com/PiHw/Pi-Kitchen/archive/master.zip)
2. Install the required software (SDFromatter) on your PC
3. Download [NOOBS](http://www.raspberrypi.org/downloads/)
4. Download [noobsconfig](https://github.com/procount/noobsconfig/blob/master/noobsconfig.zip?raw=true)
5. Adjust the `_PiKitchenBAKE.bat` script with the location of:
- Your SD-Card (insert your SD-Card reader and set the drive letter your SD-Card appears on i.e. F:)
   set SDCARD_TARGET=F:

- SDFromatter (enter the location of the SDFormatter program)
   set FORMAT_SDCARD_PROG="C:\Program Files (x86)\SDFormatter\SDFormatter.exe"

- NOOBS ZIP file (shown here located in the root of the Pi-Kitchen setup - one level above the bake folder)
   set NOOBS_SOURCE=..\NOOBS_v1_3_12.zip

- noobsconfig zip file (shown here located in the root of the Pi-Kitchen setup - one level above the bake folder)
   set NOOBSCONFIG_SOURCE=..\noobsconfig.zip

##Ingredients - Customise your flavour(s)##
To get the most out of the Pi-Kitchen you will need to customise the flavours to include the specific recipes you wish to use and to include your required settings.

**If it is your first bake, I would recommend having a test run before you change too much.**

> <img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/note.png" height=40/>
>**Note**: For more details see a particular [recipe card](https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/README.md) for details on how it works and how to adjust it, or checkout the guide on how to create multiple custom flavours for all your needs (to be released soon).

###Customise your flavour(s) - selecting recipes###
The recipes which get included in the flavour is controlled by the `recipelist.txt`, adjust this list by adding or removing `#` characters to comment in or out each recipe.

You can also create **flavour specific recipe lists**, by adding the flavour name to the start of the filename i.e. `RaspbianPiKitchenDev_recipelist.txt`.

###Your recipe _SETTINGS###
Some recipes require settings which are particular to your system and setup, so these are kept in the `_SETTINGS` folder.

For example you may want to adjust/check the following:
1. Check the `pi-kitchen\_SETTINGS` folder to ensure that you have setup your Wifi network settings (`_SETTINGS\005-wifi`) or your network share details (`_SETTINGS\009-map-network-share`) (if you are using these recipes).  Or your **internet connection sharing (ICS)** settings if using the [003-direct-network recipe](https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/003-direct-network_RECIPE_CARD.md).

i.e. By default the `wpa.conf` file in `_SETTINGS\005-wifi\wifi_example` is used for the `005-wifi` recipe.  You will need to enter your SSID and passcode for your Wifi here (see [005-wifi Recipe Card](https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/005-wifi_RECIPE_CARD.md) for details).

2. Ensure that your Wifi drivers are included in the `pi-kitchen\005-wifi\_RUNONCE\install_wifi-devices.sh` script, or if needed adjust the `006-wifi-driver` recipe to manually install it.

###Customise your recipes###
For that extra level of fine control you can also create **flavour specific recipe files**, which will use a different version of the `RECIPE_FILE_boot/data/root` files for a particular flavour.  Again, add the flavour name to the recipe file you want to customise i.e. `RaspbianSchool_RECIPE_FILE_root.txt`.  It will use **flavour specific recipe files** if present in the recipe or the default (`RECIPE_FILE_boot/data/root` file) otherwise.

> <img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/idea.png" height=40/>
>**Idea**: This is very useful, for example if you want to only install Wifi settings for a particular location when using a certain flavour.

   
##Mix - Prepping your SD-Card##
With your "Bake" script setup and any customisations made, you can now prepare your SD-Card with NOOBS and the Pi-Kitchen.  The "Bake" script will perform the following steps for you:

1. `01formatSDCard` - This will start the SDFromatter formatter program for you (but it will not automatically do any thing else).  You must manually select the drive letter for your SD-Card and ensure you set **Format Size Adjustment enabled** in the format **options**.

2. `02extractNOOBS` - This will transfer `NOOBS` and `noobsconfig` to the SD-Card (it will take a minute or so to extract and copy the distribution files).

3. `03installRecipes` - This will copy over the `sdcard\pi-kitchen` folder to the SD-Card - this contains all the recipes and flavour files needed for the Pi-Kitchen.

4. `04buildFlavours` - This will use the `recipelist.txt` files (along with the `RECIPE_FILE_boot/data/root` from each selected recipe) to create the Pi-Kitchen flavour's that will be available for the NOOBS install program.

5. `05setNOOBSmode` - Finally, you will select how you want NOOBS to start (including the video mode) and if set to perform an automatic install you can select which flavour you want installed (so it will begin installing as soon as you power on without needing a screen and keyboard to select anything).

##Bake - Bung it in the oven##
Insert the SD-Card into the Raspberry Pi and power it on.

If you selected GUI or normal, the NOOBS install screen will appear with a selection of new flavours.

If you selected `auto` installation, NOOBS should start installing your selected flavour immediately.

It can take around 30 to 45 mins for NOOBS to finish installing the SD-Card, so you will have to wait a while.

> <img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/warn.png" height=40/>
>**Warning**: If you are performing an `auto` install and do not have a screen attached you will need to keep an eye on the green activity LED to know when it has completed (watch for around a minute to see if the activity has stopped).  A serial console/debug cable will only show activity when NOOBS starts and when the OS finally loads after installation.  However, if you have your Wifi setup correctly or network cable attached you should see the Raspberry Pi appear on the list of devices if you check your router device list. 
