<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->





























<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/000-noobs-setup_RECIPE_CARD.md">000 - NOOBS Setup</a></h1>

</font>



This recipe will allow easy setup of the NOOBS configurations and allow you to switch between GUI based installs and automatic ones, as well as selecting which custom flavour you want to automatically install.  It also provides a way to quickly add the standard set of Pi-Kitchen flavours to a new clean NOOBS card.<p>It’ll even allow you to pre-select the display output NOOBS will use (although NOOBS 1.3.10 has a bug which ignores the video setting from the cmdline file, this should work for other versions of NOOBS, including any new ones).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/000-noobs-setup_RECIPE_CARD.md">000-noobs-setup_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/001-startup_RECIPE_CARD.md">(001) - Start Up - Run Once Install </a></h1>

</font>



This is a recipe which will allow a huge amount of customisation to your setup.  Enabling scripts to run on first boot (for automated installations etc), scripts to run on start-up and a run-once option (for installations which need user input) this recipe will be very useful.  It even allows scripts to be automatically from from the RECOVERY partition (so you can drop files on there from windows and they will run next time you boot your Raspberry Pi).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/001-startup_RECIPE_CARD.md">001-startup_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->





























<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/002-bootdisplay_RECIPE_CARD.md">002 - Boot Display</a></h1>

</font>



This allow you to pre-set a number of display settings (and other settings) which are set in the config.txt file of the boot partition.  This includes a script, switchdisp.sh which allows easy changing once installed on the Raspberry Pi.<p><b>Note:</b> This also fixes the forced HDMI settings which NOOBS 1.3.10 adds, even when composite video out is selected.



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/002-bootdisplay_RECIPE_CARD.md">002-bootdisplay_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->



































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/003-direct-network_RECIPE_CARD.md">003 - Direct Network Connection</a></h1>

</font>



This implements a recipe which allows easy setup of a direct network connection between a PC or Laptop and the Raspberry Pi (including sharing the PC’s Wifi network connection).  Once you have your configuration setup, you can install and connect to your Raspberry Pi, right out of the box.<p><img style="float:left" src="https://pihw.files.wordpress.com/2013/06/icsrpi.png?w=379&h=182" width=180 /><p>Laptop connected to internet via WiFi, share Wifi using ICS with Wired Connection, use Wired Connection address as Gateway (and part of RPi IP address).<p>This also includes a script switchip.sh to change configurations and to select standard network settings (as required).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/003-direct-network_RECIPE_CARD.md">003-direct-network_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->



























<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/004-no-raspiconfig_RECIPE_CARD.md">004 - No Rasp-Config</a></h1>

</font>



This recipe allows the raspi-config program which normally runs on first power up to be stopped from running (otherwise this may cause our automated startup scripts not to run/cause the Raspberry Pi to need user input).<p><b>Note:</b>This recipe is not quite ready yet (it has unwanted side-effects).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/004-no-raspiconfig_RECIPE_CARD.md">004-no-raspiconfig_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->



































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/005-wifi_RECIPE_CARD.md">005 - Wifi Configuration</a></h1>

</font>



This recipe allows the Wifi to be pre-configured using the Pi-Kitchen so that the Raspberry Pi is able to connect to your wifi network on first boot.<p> <b>Note:</b> This particular recipe does require a working wired network connection, for off-line installation of wifi drivers see the next recipe (Recipe: <a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/006-wifi-driver_RECIPE_CARD.md">006-Wifi Driver Configuration</a><p>).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/005-wifi_RECIPE_CARD.md">005-wifi_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->



































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/006-wifi-driver_RECIPE_CARD.md">006 - Wifi Driver Configuration</a></h1>

</font>



This recipe allows the Wifi Drivers to be installed as part of the Raspberry Pi first boot.  This allows the Raspberry Pi to automatically install the Wifi Drivers, configure the Wifi settings and connect when it starts up.<p><b>Note:</b> Although this requires a little more configuration upfront it does mean you do not need to connect to the internet to install the Wifi drivers.  This recipe allows the driver files to be stored on the SD-Card so the Wifi can be setup without needing a wired network connection (just power up and wait for it to install).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/006-wifi-driver_RECIPE_CARD.md">006-wifi-driver_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/007-network-share_RECIPE_CARD.md">007 - Network Share</a></h1>

</font>



This recipe allows the Raspberry Pi to share the Pi home directory on the network as a Windows Shared Folder.  This makes it easy to manage your files and back them up etc.



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/007-network-share_RECIPE_CARD.md">007-network-share_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/008-vnc_RECIPE_CARD.md">008 - VNC</a></h1>

</font>



This recipe enables VNC so we are able to remote connect and control the Raspberry Pi using a VNC connection.



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/008-vnc_RECIPE_CARD.md">008-vnc_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->





































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/009-map-network-share_RECIPE_CARD.md">009 - Map Network Share</a></h1>

</font>



This recipe allows the Raspberry Pi to map a Windows Shared Folder as a local directory.



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/009-map-network-share_RECIPE_CARD.md">009-map-network-share_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/010-scratch-gpio_RECIPE_CARD.md">010 - Scratch GPIO</a></h1>

</font>



This recipe allows the Scratch GPIO to be setup as part of the Pi-Kitchen.



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/010-scratch-gpio_RECIPE_CARD.md">010-scratch-gpio_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/011-boot-to-desktop_RECIPE_CARD.md">011 - Boot to desktop</a></h1>

</font>







For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/011-boot-to-desktop_RECIPE_CARD.md">011-boot-to-desktop_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/012-shutdown-button_RECIPE_CARD.md">012 - Shutdown Button</a></h1>

</font>



This recipe allows a physical shutdown button to be attached to the GPIO header, which when pressed will cause the Raspberry Pi to shutdown safely.  It also supports triggering of an option action via a second button (i.e. Camera shutter).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/012-shutdown-button_RECIPE_CARD.md">012-shutdown-button_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/013-enable-i2c-spi_RECIPE_CARD.md">013 - Enable I2C and SPI</a></h1>

</font>



This recipe allows the I2C and SPI to be enabled as standard and will also add the I2C Tools to the _INSTALLONCE list.



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/013-enable-i2c-spi_RECIPE_CARD.md">013-enable-i2c-spi_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/001-startup_RECIPE_CARD.md">(001) - Start Up - Run Once Install </a></h1>

</font>



This is a recipe which will allow a huge amount of customisation to your setup.  Enabling scripts to run on first boot (for automated installations etc), scripts to run on start-up and a run-once option (for installations which need user input) this recipe will be very useful.  It even allows scripts to be automatically from from the RECOVERY partition (so you can drop files on there from windows and they will run next time you boot your Raspberry Pi).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/001-startup_RECIPE_CARD.md">001-startup_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->





























<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/000-noobs-setup_RECIPE_CARD.md">000 - NOOBS Setup</a></h1>

</font>



This recipe will allow easy setup of the NOOBS configurations and allow you to switch between GUI based installs and automatic ones, as well as selecting which custom flavour you want to automatically install.  It also provides a way to quickly add the standard set of Pi-Kitchen flavours to a new clean NOOBS card.<p>It’ll even allow you to pre-select the display output NOOBS will use (although NOOBS 1.3.10 has a bug which ignores the video setting from the cmdline file, this should work for other versions of NOOBS, including any new ones).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/000-noobs-setup_RECIPE_CARD.md">000-noobs-setup_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/001-startup_RECIPE_CARD.md">(001) - Start Up - Run Once Install </a></h1>

</font>



This is a recipe which will allow a huge amount of customisation to your setup.  Enabling scripts to run on first boot (for automated installations etc), scripts to run on start-up and a run-once option (for installations which need user input) this recipe will be very useful.  It even allows scripts to be automatically from from the RECOVERY partition (so you can drop files on there from windows and they will run next time you boot your Raspberry Pi).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/001-startup_RECIPE_CARD.md">001-startup_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->





























<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/002-bootdisplay_RECIPE_CARD.md">002 - Boot Display</a></h1>

</font>



This allow you to pre-set a number of display settings (and other settings) which are set in the config.txt file of the boot partition.  This includes a script, switchdisp.sh which allows easy changing once installed on the Raspberry Pi.<p><b>Note:</b> This also fixes the forced HDMI settings which NOOBS 1.3.10 adds, even when composite video out is selected.



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/002-bootdisplay_RECIPE_CARD.md">002-bootdisplay_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->



































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/003-direct-network_RECIPE_CARD.md">003 - Direct Network Connection</a></h1>

</font>



This implements a recipe which allows easy setup of a direct network connection between a PC or Laptop and the Raspberry Pi (including sharing the PC’s Wifi network connection).  Once you have your configuration setup, you can install and connect to your Raspberry Pi, right out of the box.<p><img style="float:left" src="https://pihw.files.wordpress.com/2013/06/icsrpi.png?w=379&h=182" width=180 /><p>Laptop connected to internet via WiFi, share Wifi using ICS with Wired Connection, use Wired Connection address as Gateway (and part of RPi IP address).<p>This also includes a script switchip.sh to change configurations and to select standard network settings (as required).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/003-direct-network_RECIPE_CARD.md">003-direct-network_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->



























<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/004-no-raspiconfig_RECIPE_CARD.md">004 - No Rasp-Config</a></h1>

</font>



This recipe allows the raspi-config program which normally runs on first power up to be stopped from running (otherwise this may cause our automated startup scripts not to run/cause the Raspberry Pi to need user input).<p><b>Note:</b>This recipe is not quite ready yet (it has unwanted side-effects).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/004-no-raspiconfig_RECIPE_CARD.md">004-no-raspiconfig_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->



































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/005-wifi_RECIPE_CARD.md">005 - Wifi Configuration</a></h1>

</font>



This recipe allows the Wifi to be pre-configured using the Pi-Kitchen so that the Raspberry Pi is able to connect to your wifi network on first boot.<p> <b>Note:</b> This particular recipe does require a working wired network connection, for off-line installation of wifi drivers see the next recipe (Recipe: <a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/006-wifi-driver_RECIPE_CARD.md">006-Wifi Driver Configuration</a><p>).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/005-wifi_RECIPE_CARD.md">005-wifi_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->



































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/006-wifi-driver_RECIPE_CARD.md">006 - Wifi Driver Configuration</a></h1>

</font>



This recipe allows the Wifi Drivers to be installed as part of the Raspberry Pi first boot.  This allows the Raspberry Pi to automatically install the Wifi Drivers, configure the Wifi settings and connect when it starts up.<p><b>Note:</b> Although this requires a little more configuration upfront it does mean you do not need to connect to the internet to install the Wifi drivers.  This recipe allows the driver files to be stored on the SD-Card so the Wifi can be setup without needing a wired network connection (just power up and wait for it to install).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/006-wifi-driver_RECIPE_CARD.md">006-wifi-driver_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/007-network-share_RECIPE_CARD.md">007 - Network Share</a></h1>

</font>



This recipe allows the Raspberry Pi to share the Pi home directory on the network as a Windows Shared Folder.  This makes it easy to manage your files and back them up etc.



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/007-network-share_RECIPE_CARD.md">007-network-share_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/008-vnc_RECIPE_CARD.md">008 - VNC</a></h1>

</font>



This recipe enables VNC so we are able to remote connect and control the Raspberry Pi using a VNC connection.



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/008-vnc_RECIPE_CARD.md">008-vnc_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->





































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/009-map-network-share_RECIPE_CARD.md">009 - Map Network Share</a></h1>

</font>



This recipe allows the Raspberry Pi to map a Windows Shared Folder as a local directory.



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/009-map-network-share_RECIPE_CARD.md">009-map-network-share_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/010-scratch-gpio_RECIPE_CARD.md">010 - Scratch GPIO</a></h1>

</font>



This recipe allows the Scratch GPIO to be setup as part of the Pi-Kitchen.



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/010-scratch-gpio_RECIPE_CARD.md">010-scratch-gpio_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/011-boot-to-desktop_RECIPE_CARD.md">011 - Boot to desktop</a></h1>

</font>







For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/011-boot-to-desktop_RECIPE_CARD.md">011-boot-to-desktop_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/012-shutdown-button_RECIPE_CARD.md">012 - Shutdown Button</a></h1>

</font>



This recipe allows a physical shutdown button to be attached to the GPIO header, which when pressed will cause the Raspberry Pi to shutdown safely.  It also supports triggering of an option action via a second button (i.e. Camera shutter).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/012-shutdown-button_RECIPE_CARD.md">012-shutdown-button_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/013-enable-i2c-spi_RECIPE_CARD.md">013 - Enable I2C and SPI</a></h1>

</font>



This recipe allows the I2C and SPI to be enabled as standard and will also add the I2C Tools to the _INSTALLONCE list.



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/013-enable-i2c-spi_RECIPE_CARD.md">013-enable-i2c-spi_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->





























<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/000-noobs-setup_RECIPE_CARD.md">000 - NOOBS Setup</a></h1>

</font>



This recipe will allow easy setup of the NOOBS configurations and allow you to switch between GUI based installs and automatic ones, as well as selecting which custom flavour you want to automatically install.  It also provides a way to quickly add the standard set of Pi-Kitchen flavours to a new clean NOOBS card.<p>It’ll even allow you to pre-select the display output NOOBS will use (although NOOBS 1.3.10 has a bug which ignores the video setting from the cmdline file, this should work for other versions of NOOBS, including any new ones).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/000-noobs-setup_RECIPE_CARD.md">000-noobs-setup_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/001-startup_RECIPE_CARD.md">(001) - Start Up - Run Once Install </a></h1>

</font>



This is a recipe which will allow a huge amount of customisation to your setup.  Enabling scripts to run on first boot (for automated installations etc), scripts to run on start-up and a run-once option (for installations which need user input) this recipe will be very useful.  It even allows scripts to be automatically from from the RECOVERY partition (so you can drop files on there from windows and they will run next time you boot your Raspberry Pi).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/001-startup_RECIPE_CARD.md">001-startup_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->





























<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/000-noobs-setup_RECIPE_CARD.md">000 - NOOBS Setup</a></h1>

</font>



This recipe will allow easy setup of the NOOBS configurations and allow you to switch between GUI based installs and automatic ones, as well as selecting which custom flavour you want to automatically install.  It also provides a way to quickly add the standard set of Pi-Kitchen flavours to a new clean NOOBS card.<p>It’ll even allow you to pre-select the display output NOOBS will use (although NOOBS 1.3.10 has a bug which ignores the video setting from the cmdline file, this should work for other versions of NOOBS, including any new ones).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/000-noobs-setup_RECIPE_CARD.md">000-noobs-setup_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/001-startup_RECIPE_CARD.md">(001) - Start Up - Run Once Install </a></h1>

</font>



This is a recipe which will allow a huge amount of customisation to your setup.  Enabling scripts to run on first boot (for automated installations etc), scripts to run on start-up and a run-once option (for installations which need user input) this recipe will be very useful.  It even allows scripts to be automatically from from the RECOVERY partition (so you can drop files on there from windows and they will run next time you boot your Raspberry Pi).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/001-startup_RECIPE_CARD.md">001-startup_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->





























<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/002-bootdisplay_RECIPE_CARD.md">002 - Boot Display</a></h1>

</font>



This allow you to pre-set a number of display settings (and other settings) which are set in the config.txt file of the boot partition.  This includes a script, switchdisp.sh which allows easy changing once installed on the Raspberry Pi.<p><b>Note:</b> This also fixes the forced HDMI settings which NOOBS 1.3.10 adds, even when composite video out is selected.



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/002-bootdisplay_RECIPE_CARD.md">002-bootdisplay_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->



































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/003-direct-network_RECIPE_CARD.md">003 - Direct Network Connection</a></h1>

</font>



This implements a recipe which allows easy setup of a direct network connection between a PC or Laptop and the Raspberry Pi (including sharing the PC’s Wifi network connection).  Once you have your configuration setup, you can install and connect to your Raspberry Pi, right out of the box.<p><img style="float:left" src="https://pihw.files.wordpress.com/2013/06/icsrpi.png?w=379&h=182" width=180 /><p>Laptop connected to internet via WiFi, share Wifi using ICS with Wired Connection, use Wired Connection address as Gateway (and part of RPi IP address).<p>This also includes a script switchip.sh to change configurations and to select standard network settings (as required).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/003-direct-network_RECIPE_CARD.md">003-direct-network_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->



























<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/004-no-raspiconfig_RECIPE_CARD.md">004 - No Rasp-Config</a></h1>

</font>



This recipe allows the raspi-config program which normally runs on first power up to be stopped from running (otherwise this may cause our automated startup scripts not to run/cause the Raspberry Pi to need user input).<p><b>Note:</b>This recipe is not quite ready yet (it has unwanted side-effects).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/004-no-raspiconfig_RECIPE_CARD.md">004-no-raspiconfig_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->



































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/005-wifi_RECIPE_CARD.md">005 - Wifi Configuration</a></h1>

</font>



This recipe allows the Wifi to be pre-configured using the Pi-Kitchen so that the Raspberry Pi is able to connect to your wifi network on first boot.<p> <b>Note:</b> This particular recipe does require a working wired network connection, for off-line installation of wifi drivers see the next recipe (Recipe: <a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/006-wifi-driver_RECIPE_CARD.md">006-Wifi Driver Configuration</a><p>).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/005-wifi_RECIPE_CARD.md">005-wifi_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->



































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/006-wifi-driver_RECIPE_CARD.md">006 - Wifi Driver Configuration</a></h1>

</font>



This recipe allows the Wifi Drivers to be installed as part of the Raspberry Pi first boot.  This allows the Raspberry Pi to automatically install the Wifi Drivers, configure the Wifi settings and connect when it starts up.<p><b>Note:</b> Although this requires a little more configuration upfront it does mean you do not need to connect to the internet to install the Wifi drivers.  This recipe allows the driver files to be stored on the SD-Card so the Wifi can be setup without needing a wired network connection (just power up and wait for it to install).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/006-wifi-driver_RECIPE_CARD.md">006-wifi-driver_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/007-network-share_RECIPE_CARD.md">007 - Network Share</a></h1>

</font>



This recipe allows the Raspberry Pi to share the Pi home directory on the network as a Windows Shared Folder.  This makes it easy to manage your files and back them up etc.



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/007-network-share_RECIPE_CARD.md">007-network-share_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/008-vnc_RECIPE_CARD.md">008 - VNC</a></h1>

</font>



This recipe enables VNC so we are able to remote connect and control the Raspberry Pi using a VNC connection.



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/008-vnc_RECIPE_CARD.md">008-vnc_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->





































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/009-map-network-share_RECIPE_CARD.md">009 - Map Network Share</a></h1>

</font>



This recipe allows the Raspberry Pi to map a Windows Shared Folder as a local directory.



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/009-map-network-share_RECIPE_CARD.md">009-map-network-share_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/010-scratch-gpio_RECIPE_CARD.md">010 - Scratch GPIO</a></h1>

</font>



This recipe allows the Scratch GPIO to be setup as part of the Pi-Kitchen.



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/010-scratch-gpio_RECIPE_CARD.md">010-scratch-gpio_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/011-boot-to-desktop_RECIPE_CARD.md">011 - Boot to desktop</a></h1>

</font>







For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/011-boot-to-desktop_RECIPE_CARD.md">011-boot-to-desktop_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/012-shutdown-button_RECIPE_CARD.md">012 - Shutdown Button</a></h1>

</font>



This recipe allows a physical shutdown button to be attached to the GPIO header, which when pressed will cause the Raspberry Pi to shutdown safely.  It also supports triggering of an option action via a second button (i.e. Camera shutter).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/012-shutdown-button_RECIPE_CARD.md">012-shutdown-button_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/013-enable-i2c-spi_RECIPE_CARD.md">013 - Enable I2C and SPI</a></h1>

</font>



This recipe allows the I2C and SPI to be enabled as standard and will also add the I2C Tools to the _INSTALLONCE list.



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/013-enable-i2c-spi_RECIPE_CARD.md">013-enable-i2c-spi_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->





























<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/000-noobs-setup_RECIPE_CARD.md">000 - NOOBS Setup</a></h1>

</font>



This recipe will allow easy setup of the NOOBS configurations and allow you to switch between GUI based installs and automatic ones, as well as selecting which custom flavour you want to automatically install.  It also provides a way to quickly add the standard set of Pi-Kitchen flavours to a new clean NOOBS card.<p>It’ll even allow you to pre-select the display output NOOBS will use (although NOOBS 1.3.10 has a bug which ignores the video setting from the cmdline file, this should work for other versions of NOOBS, including any new ones).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/000-noobs-setup_RECIPE_CARD.md">000-noobs-setup_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/001-startup_RECIPE_CARD.md">(001) - Start Up - Run Once Install </a></h1>

</font>



This is a recipe which will allow a huge amount of customisation to your setup.  Enabling scripts to run on first boot (for automated installations etc), scripts to run on start-up and a run-once option (for installations which need user input) this recipe will be very useful.  It even allows scripts to be automatically from from the RECOVERY partition (so you can drop files on there from windows and they will run next time you boot your Raspberry Pi).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/001-startup_RECIPE_CARD.md">001-startup_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->





























<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/002-bootdisplay_RECIPE_CARD.md">002 - Boot Display</a></h1>

</font>



This allow you to pre-set a number of display settings (and other settings) which are set in the config.txt file of the boot partition.  This includes a script, switchdisp.sh which allows easy changing once installed on the Raspberry Pi.<p><b>Note:</b> This also fixes the forced HDMI settings which NOOBS 1.3.10 adds, even when composite video out is selected.



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/002-bootdisplay_RECIPE_CARD.md">002-bootdisplay_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->



































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/003-direct-network_RECIPE_CARD.md">003 - Direct Network Connection</a></h1>

</font>



This implements a recipe which allows easy setup of a direct network connection between a PC or Laptop and the Raspberry Pi (including sharing the PC’s Wifi network connection).  Once you have your configuration setup, you can install and connect to your Raspberry Pi, right out of the box.<p><img style="float:left" src="https://pihw.files.wordpress.com/2013/06/icsrpi.png?w=379&h=182" width=180 /><p>Laptop connected to internet via WiFi, share Wifi using ICS with Wired Connection, use Wired Connection address as Gateway (and part of RPi IP address).<p>This also includes a script switchip.sh to change configurations and to select standard network settings (as required).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/003-direct-network_RECIPE_CARD.md">003-direct-network_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->



























<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/004-no-raspiconfig_RECIPE_CARD.md">004 - No Rasp-Config</a></h1>

</font>



This recipe allows the raspi-config program which normally runs on first power up to be stopped from running (otherwise this may cause our automated startup scripts not to run/cause the Raspberry Pi to need user input).<p><b>Note:</b>This recipe is not quite ready yet (it has unwanted side-effects).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/004-no-raspiconfig_RECIPE_CARD.md">004-no-raspiconfig_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->



































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/005-wifi_RECIPE_CARD.md">005 - Wifi Configuration</a></h1>

</font>



This recipe allows the Wifi to be pre-configured using the Pi-Kitchen so that the Raspberry Pi is able to connect to your wifi network on first boot.<p> <b>Note:</b> This particular recipe does require a working wired network connection, for off-line installation of wifi drivers see the next recipe (Recipe: <a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/006-wifi-driver_RECIPE_CARD.md">006-Wifi Driver Configuration</a><p>).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/005-wifi_RECIPE_CARD.md">005-wifi_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->



































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/006-wifi-driver_RECIPE_CARD.md">006 - Wifi Driver Configuration</a></h1>

</font>



This recipe allows the Wifi Drivers to be installed as part of the Raspberry Pi first boot.  This allows the Raspberry Pi to automatically install the Wifi Drivers, configure the Wifi settings and connect when it starts up.<p><b>Note:</b> Although this requires a little more configuration upfront it does mean you do not need to connect to the internet to install the Wifi drivers.  This recipe allows the driver files to be stored on the SD-Card so the Wifi can be setup without needing a wired network connection (just power up and wait for it to install).



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/006-wifi-driver_RECIPE_CARD.md">006-wifi-driver_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/007-network-share_RECIPE_CARD.md">007 - Network Share</a></h1>

</font>



This recipe allows the Raspberry Pi to share the Pi home directory on the network as a Windows Shared Folder.  This makes it easy to manage your files and back them up etc.



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/007-network-share_RECIPE_CARD.md">007-network-share_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/008-vnc_RECIPE_CARD.md">008 - VNC</a></h1>

</font>



This recipe enables VNC so we are able to remote connect and control the Raspberry Pi using a VNC connection.



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/008-vnc_RECIPE_CARD.md">008-vnc_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->





































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/009-map-network-share_RECIPE_CARD.md">009 - Map Network Share</a></h1>

</font>



This recipe allows the Raspberry Pi to map a Windows Shared Folder as a local directory.



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/009-map-network-share_RECIPE_CARD.md">009-map-network-share_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->

<!-- How to use comments in these files -->

<!-- ---------------------------------- -->

<!--Comments have been put in this file so that they can be automatically generated.



[How to customise the Markdown documents](CustomMarkdown.md)-->

<!--Template 03/01/2015-->































<font color = GREEN>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />

<h1><a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/010-scratch-gpio_RECIPE_CARD.md">010 - Scratch GPIO</a></h1>

</font>



This recipe allows the Scratch GPIO to be setup as part of the Pi-Kitchen.



For more details see...<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/010-scratch-gpio_RECIPE_CARD.md">010-scratch-gpio_RECIPE_CARD.md</a><p>





<!--========================END FILE================-->
