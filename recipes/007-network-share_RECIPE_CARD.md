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
<h1>007 : Network Share</h1>
</font>

<table style="width:35%" align="right" >
  <tr>
    <th bgcolor=black><font color=white>Recipe Files</th>
    <th bgcolor=black><font color=white>Ingredients</th>
  </tr>
  <tr>
    <td>
              <i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/007-network-share/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b><p>
            </td>		
    <td><i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/007-network-share_INGREDIENTS.zip">007-network-share_INGREDIENTS.zip</a></i></b></td>
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
<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/Recipe 001-Startup">Recipe 001-Startup</a><p>
</font>

<br>


##Description##
<font color = GREEN>
SMB network share

The smb.conf needs to be copied over after samba has been installed.
Since this will need internet connection to install samba and user prompt to set password, this must be run manually by the user.

sudo ~/bin/install_smbshare.sh

#Noobs Config#

`/home/pi/recovery/pi-kitchen/007-network-share/bin/install_smbshare.sh home/pi/bin`</font>

##How to use##
<font color = GREEN>
Following installation of the OS, run the `_INSTALLONCE/installonce.sh` script and follow the steps to setup the network share.<p><p>
</font>

##Ingredients##
The ingredient files should be placed in the following location on the NOOBS RECOVERY partition:<p>

<font color = GREEN>
<code>pi-kitchen/007-network-share</code><p>
</font>

This recipe uses the following files:<p>
<font color = GREEN>
bin/_INSTALLONCE/install_smbshare.sh<p> etc/samba/smb.conf<p>deb/libwbclient0_3.6.6-6+deb7u4_armhf.deb<p>deb/samba_3.6.6-6+deb7u4_armhf.deb<p>deb/samba-common_3.6.6-6+deb7u4_all.deb<p>deb/tdb-tools_1.2.10-2_armhf.deb<p><p>
</font>


You can download all the <a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/007-network-share_INGREDIENTS.zip">ingredient files</a>, and extracted directly to the NOOBS SD-Card (ensuring you remove the ZIP file's name from the directory - the files should be extracted to <code>pi-kitchen/007-network-share</code>).<p>

##The Recipe Files##
Each recipe will use one file for each of the partitions it installs to - boot, root and data).<p>


You will need to suitably rename or copy the content of each of the following files into your recipe files (i.e. <code>RaspbianPiKitchen_root.txt</code>) and place them in your os folder in the NOOBS partition (i.e. <code>os/Raspbian</code>).<p>

For more information see the <a href="http://pihw.wordpress.com/guides/pi-kitchen/creatingflavours">Pi-Kitchen: Creating Flavours</a> guide.<p>


<i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/007-network-share/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b>
<pre>
#
#Recipe: 007-network-share
#- Add files to setup SAMBA SMB folder share (need to run manually)
../../pi-kitchen/007-network-share/_INSTALLONCE/install_smbshare.sh /home/pi/bin/_INSTALLONCE
</pre>



<hr>

Enjoy baking your Raspberry Pi SD-Card fresh from the Pi-Kitchen.<p>

<!--========================END FILE================-->
