@echo off
REM This script will copy the PiKitchen recipes to the SDCARD.
REM 03installRecipes target recipesource
echo #### Install Recipes ####

REM Read in the command line inputs:
REM SDCARD_TARGET
if [%1] == [] (
  set SDCARD_TARGET=F:
) else (
  set SDCARD_TARGET=%1
)
echo SDCard Location: %SDCARD_TARGET%

REM RECIPE_SOURCE
if [%2] == [] (
  set RECIPE_SOURCE=..\..\Pi-Kitchen-master\sdcard\pi-kitchen
) else (
  set RECIPE_SOURCE=%2
)
echo NOOBS Source: %RECIPE_SOURCE%

REM Transferring Recipes
echo Transferring Recipes...

xcopy %RECIPE_SOURCE% %SDCARD_TARGET%\pi-kitchen\ /Y /E

echo Done!
echo #######################