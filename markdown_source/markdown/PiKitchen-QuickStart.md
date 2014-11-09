<img src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/pihwlogotm.png" width=180 />
------------
<img src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchen.png" width=150 />

#Pi-Kitchen: Quick Start#

There are two main types of configurations you may want to use the Pi-Kitchen for:

- Multi-flavour setup
- Automated setup

This quick start will help you create a standard setup of each type, to learn more about them please see the following guides for more information:

- <a href="https://github.com/PiHw/Pi-Kitchen/blob/master/markdown_source/markdown/PiKitchen-GettingStarted.md">Pi-Kitchen Getting Started</a>
- <a href="https://github.com/PiHw/Pi-Kitchen/blob/master/markdown_source/markdown/PiKitchen-CreatingFlavours.md">Pi-Kitchen Creating Flavours</a>
- <a href="https://github.com/PiHw/Pi-Kitchen/blob/master/markdown_source/markdown/PiKitchen-AutomaticInstallations.md">Pi-Kitchen Automatic Installations</a>


##  Multi-flavour setup ##

Perform the following steps to create a typical multi-flavour setup:

1. Download and extract [NOOBS](http://www.raspberrypi.org/downloads/) onto the SD-Card
2. Download and extract [noobsconfig](https://github.com/procount/noobsconfig/blob/master/noobsconfig.zip?raw=true) onto the SD-Card
3. Download and extract <a href="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/guides/QuickStartFlavours.zip">`QuickStartFlavours.zip`</a>, which includes:
	- Standard NOOBS install `recovery.cmdline`
	- Updated `flavours.json` for `"RaspberryPiKitchen"` and `"RaspberryPiKitchenDev"`
	- Added flavour icons
	- Added `boot/root/data` recipe files
	- Updated `partitions.json` and added empty `data.tar.xz` file to enable the user data partition
	- Added additional PiHw install slides



## Automated setup ##
Perform the following steps to create a typical automated setup:

1. Download and extract [NOOBS](http://www.raspberrypi.org/downloads/) onto the SD-Card
2. Download and extract [noobsconfig](https://github.com/procount/noobsconfig/blob/master/noobsconfig.zip?raw=true) onto the SD-Card
3. Download and extract <a href="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/guides/QuickStartAuto.zip">`QuickStartAuto.zip`</a>, which includes:
	- Automated NOOBS install `recovery.cmdline`
	- Updated `flavours.json` to only include `"RaspberryPiKitchen"`
	- Added `RaspberryPiKitchen.png` flavour icon
	- Added `boot/root/data` recipe files
	- Updated `partitions.json` and added empty `data.tar.xz` file to enable the user data partition
	- Added additional PiHw install slides
4. You must rename any `os.json` file which isn't in the `os\Raspbian` directory (on the most recent NOOBS setup, there is just the one `os\Data_Partition\os.json` which you can rename to `os.json.removed` or similar).


## Finally a sprinkle of ingredients##
You are now all set to download and extract the ingredients of your required recipe and merge the recipe file into the `boot/root/data` recipes.

For example Recipe 001: Direct Network

<a href="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/guides/direct-network_INGREDIENTS.zip">`direct-network_INGREDIENTS.zip`</a>

Adjust the recipe files to include the content of each of the RECIPE files:
<a href="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/sdcard/pi-kitchen/direct-network/RECIPE_FILE_boot.txt">`RECIPE_FILE_boot.txt`</a>

<a href="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/sdcard/pi-kitchen/direct-network/RECIPE_FILE_root.txt">`RECIPE_FILE_root.txt`</a>

For the above examples, these will be the following files:

	os/Rasbian/RaspbianPiKitchen_boot.txt
	os/Rasbian/RaspbianPiKitchen_root.txt
<a href="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/guides/RecipeDirectNetwork.zip">`RecipeDirectNetwork.zip`</a>
