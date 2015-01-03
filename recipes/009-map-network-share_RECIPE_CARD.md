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
<h1>009 : Map Network Share</h1>
</font>

<table style="width:35%" align="right" >
  <tr>
    <th bgcolor=black><font color=white>Recipe Files</th>
    <th bgcolor=black><font color=white>Ingredients</th>
  </tr>
  <tr>
    <td>
              <i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/009-map-network-share/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b><p>
            </td>		
    <td><i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/009-map-network-share_INGREDIENTS.zip">009-map-network-share_INGREDIENTS.zip</a></i></b></td>
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
<a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipe/Recipe 001-Startup">Recipe 001-Startup</a><p>
</font>

See the markdown version of this recipe on the <a href="https://github.com/PiHw/Pi-Kitchen">Pi-Kitchen GitHub</a> site see:
<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/009-map-network-share_RECIPE_CARD.md">009-Map Network Share.md</a>

<br>


##Description##
<font color = GREEN>
By using the Samba share setup by <a href="http://pihardware.com/guides/pi-kitchen/networkshare/">Recipe 007: Network Share</a> we can access the files on the Raspberry Pi from other computers.  However, we can also share files over the network by accessing files which are located on other computers (or network drives if you have one).

You will need a standard Windows share setup on your network (or a linux Samba share - such as another Raspberry Pi with a shared folder).

Next update the `mapnetworkshare.sh` script located in the `_SETTINGS/009-map-network-share` directory to include the network share, mounting folder (and if required the username and password).

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/note.png" height=40/>
<b>NOTE:</b> You may find that you have to use the IP address of the computer (i.e. 192.168.0.10) you want to connect to, rather than its hostname (i.e. PCNAME).

##References##
For more details about mounting network shares, see the following site (which provided the details needed to create this recipe):
<a href="http://rasspberrypi.wordpress.com/2012/09/04/mounting-and-automounting-windows-shares-on-rasperry-pi/">Raspberry Pi Adventures - Mounting and Automounting Windows Shares on Raspberry Pi</a>
</font>

##How to use##
<font color = GREEN>
Update the details in the 'mapnetworkshare.sh' script to include the network path of the shared directory (and username and password if applicable).<p><p>
</font>

##Ingredients##
The ingredient files should be placed in the following location on the NOOBS RECOVERY partition:<p>

<font color = GREEN>
<code>pi-kitchen/009-map-network-share</code><p>
</font>

This recipe uses the following files:<p>
<font color = GREEN>
dummydir.txt<p> bin/_RUNSTART/mapnetworkshare.sh<p>
</font>

<b>Plus the following files in the _SETTINGS folder:</b><p>

It is assumed that the following file(s) are placed in the following location on the NOOBS RECOVERY partition:<p>
<font color = GREEN>
<code>pi-kitchen/_SETTINGS/009-map-network-share</code><p>
</font>

You will need the following _SETTINGS file(s):<p>

<font color = GREEN>
009-map-network-share/mapnetworkshare.sh<p><p>
</font>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/note.png" height=40/>
<b>NOTE:</b> Files which are configured manually or may contain sensitive information are placed in the _SETTTINGS directory on the SD-Card.  This is so that it is easier to support different configurations and remove sensitive information from the setup if needed.<p>

Perform the following actions:<p>
<font color = GREEN>
Ensure you update the 'mapnetworkshare.sh' script to include the network path of the shared directory (and username and password if applicable).<p>
</font>

You can download all the <a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/009-map-network-share_INGREDIENTS.zip">ingredient files</a>, and extracted directly to the NOOBS SD-Card (ensuring you remove the ZIP file's name from the directory - the files should be extracted to <code>pi-kitchen/009-map-network-share</code>).<p>

##The Recipe Files##
Each recipe will use one file for each of the partitions it installs to - boot, root and data).<p>


You will need to suitably rename or copy the content of each of the following files into your recipe files (i.e. <code>RaspbianPiKitchen_root.txt</code>) and place them in your os folder in the NOOBS partition (i.e. <code>os/Raspbian</code>).<p>

For more information see the <a href="http://pihw.wordpress.com/guides/pi-kitchen/creatingflavours">Pi-Kitchen: Creating Flavours</a> guide.<p>


<i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/009-map-network-share/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b>
<pre>
#
#Recipe: 009-map-network-share
#- Create mount location
../../pi-kitchen/009-map-network-share/dummydir.txt /home/pi/network
#- Add script to _RUNSTART folder
../../pi-kitchen/_SETTINGS/009-map-network-share/mapnetworkshare.sh /home/pi/bin/_RUNSTART

</pre>



<hr>

Enjoy baking your Raspberry Pi SD-Card fresh from the Pi-Kitchen.<p>

<!--========================END FILE================-->
