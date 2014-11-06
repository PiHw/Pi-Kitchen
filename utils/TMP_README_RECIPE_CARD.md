<!-- How to use comments in these files -->
<!-- ---------------------------------- -->
<!--Comments have been put in this file so that they can be customised for a range of workshops and uses.

[How to customise the Markdown documents](CustomMarkdown.md)-->

<!---#include "RECIPE_CARD.txt"--->


<!---#define RC_RECIPE_COLOUR GREEN--->


<img src="img/pihwlogotm.png" width=180 />
----------

<img style="float:left" src="img/PiKitchenRecipe.png" width=180 /> #Recipe Card#

<!---#ifdef RC_NUMBER--->
<!---#ifdef RC_NAME--->
<font color = RC_RECIPE_COLOUR>
#RC_NUMBER RC_NAME#
</font>
<!---#endif--->
<!---#endif--->

<!---#ifdef RC_DESC--->
<font color = RC_RECIPE_COLOUR>
RC_DESC<p>
</font>
<!---#endif--->

<!---#ifdef RC_HOWTOUSE--->
<font color = RC_RECIPE_COLOUR>
RC_HOWTOUSE<p>
</font>
<!---#endif--->

##The Ingredient Files##
Unless otherwise stated files should be placed in the following location on the NOOBS RECOVERY partition:<p>

<font color = RC_RECIPE_COLOUR>
<code>RC_SOURCE_LOCATION</code><p>
</font>

<b>This recipe uses the following files:</b><p>
<font color = RC_RECIPE_COLOUR>
<code>RC_INGREDIENTS</code><p>
</font>

<!---#ifdef RC_INGREDIENTS_SETTING--->
<b>Plus the following files in the _SETTINGS folder:</b><p>

It is assumed that the following file(s) are placed in the following location on the NOOBS RECOVERY partition:<p>
<font color = RC_RECIPE_COLOUR>
<code>RC_SOURCE_LOCATION_SETTING</code><p>
</font>

You will need the following _SETTINGS file(s):<p>

<font color = RC_RECIPE_COLOUR>
RC_INGREDIENTS_SETTING<p>
</font>

> <img style="float:left" src="img/note.png" height=40/>
> **NOTE:** Files which are configured manually or may contain sensitive information are placed in the _SETTTINGS directory on the SD-Card.  This is so that it is easier to support different configurations and remove sensitive information from the setup if needed.<p>

<!---#ifdef RC_SETTING_DESC--->
Perform the following actions:<p>
<font color = RC_RECIPE_COLOUR>
RC_SETTING_DESC<p>
</font>
<!---#endif--->
<!---#endif--->

##The Recipe Files##
Each recipe can use up to three files (one for each of the three main partitions - boot, root and data).

> <img style="float:left" src="img/note.png" height=40/>
> **NOTE:** The data partition does not normally exist for most installations unless manually selected.  However you can also include this partition automatically if desired (see the [Pi-Kitchen: Automatic Installations](PiKitchen-AutomaticInstallations.md) guide for more details).<p>

You will need to suitably rename or copy the content of each of the following files into your recipe files (i.e. <code>RaspbianPiKitchen_root.txt</code>) and place them in your os folder in the NOOBS partition (i.e. <code>os/Raspbian</code>).<p>

For more information see the [Pi-Kitchen: Creating Flavours](PiKitchen-CreatingFlavours.md) guide.<p>

<!---#ifdef RC_BOOT--->
***(flavour)_boot.txt***
<pre>
<!---#include RECIPE_FILE_boot.txt--->
</pre>
<!---#endif--->

<!---#ifdef RC_ROOT--->
***(flavour)_root.txt***
<pre>
<!---#include RECIPE_FILE_root.txt--->
</pre>
<!---#endif--->

<!---#ifdef RC_DATA--->
***(flavour)_data.txt***
<pre>
<!---#include RECIPE_FILE_data.txt--->
</pre>
<!---#endif--->


---------
Enjoy baking your Raspberry Pi SD-Card fresh from the Pi-Kitchen.

<!--========================END FILE================-->