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
<h1>015 : HW PiStop Lighthouse</h1>
</font>

<table style="width:35%" align="right" >
  <tr>
    <th bgcolor=black><font color=white>Recipe Files</th>
    <th bgcolor=black><font color=white>Ingredients</th>
  </tr>
  <tr>
    <td>
              <i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/015-hw-pistop-lighthouse/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b><p>
            </td>		
    <td><i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/015-hw-pistop-lighthouse_INGREDIENTS.zip">015-hw-pistop-lighthouse_INGREDIENTS.zip</a></i></b></td>
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
#HW IP Display Dongle#

This recipe is intended to support the <a href="http://4tronix.co.uk/store/index.php?rt=product/product&product_id=390">PiHardware and 4tronix PiStop</a>:
<img src="https://raw.githubusercontent.com/PiHw/Pi-Stop/master/markdown_source/markdown/img/Pi-StopQuadFun.jpg"/>

##Running a demo automatically##
You will need to copy the `runpythonpirateE.sh` or `runtrafficlight.sh` to the NOOBS partition `_USER/_RUNSTARTBG` (recommended so you can adjust/remove easily) or use the `/home/pi/bin/_RUNSTARTBG` directory (which you can set the recipe file to copy).

For more information on the PiStop and the source files used for this recipe, see the <a href="https://github.com/PiHw/Pi-Stop"> PiStop Github</a>.

</font>

##How to use##
<font color = GREEN>
<p>
</font>

##Ingredients##
The ingredient files should be placed in the following location on the NOOBS RECOVERY partition:<p>

<font color = GREEN>
<code>pi-kitchen/015-hw-pistop-lighthouse</code><p>
</font>

This recipe uses the following files:<p>
<font color = GREEN>
<p>
</font>


You can download all the <a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/015-hw-pistop-lighthouse_INGREDIENTS.zip">ingredient files</a>, and extracted directly to the NOOBS SD-Card (ensuring you remove the ZIP file's name from the directory - the files should be extracted to <code>pi-kitchen/015-hw-pistop-lighthouse</code>).<p>

##The Recipe Files##
Each recipe will use one file for each of the partitions it installs to - boot, root and data).<p>


You will need to suitably rename or copy the content of each of the following files into your recipe files (i.e. <code>RaspbianPiKitchen_root.txt</code>) and place them in your os folder in the NOOBS partition (i.e. <code>os/Raspbian</code>).<p>

For more information see the <a href="http://pihw.wordpress.com/guides/pi-kitchen/creatingflavours">Pi-Kitchen: Creating Flavours</a> guide.<p>


<i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/015-hw-pistop-lighthouse/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b>
<pre>
#
#Recipe: 015-hw-pistop-lighthouse
#- Add pistop class and files
../../pi-kitchen/015-hw-pistop-lighthouse/pistop/pistop.py /home/pi/pistop
../../pi-kitchen/015-hw-pistop-lighthouse/pistop/trafficlights.py /home/pi/pistop
../../pi-kitchen/015-hw-pistop-lighthouse/pistop/runtrafficlight.sh /home/pi/pistop</pre>



<hr>

Enjoy baking your Raspberry Pi SD-Card fresh from the Pi-Kitchen.<p>

<!--========================END FILE================-->
