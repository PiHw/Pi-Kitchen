REM www.pihardware.com Pi-Kitchen
REM This script will build the flavour files (i.e. RaspbianPiKitchen_boot.txt etc).
REM 04buildFlavours target flavour
echo #### Build Flavours ####

REM Read in the command line inputs:
REM SDCARD_TARGET
if [%1] == [] (
  set SDCARD_TARGET=F:
) else (
  set SDCARD_TARGET=%1
)
echo SDCard Location: %SDCARD_TARGET%

REM FLAVOUR
if [%2] == [] (
  set FLAVOUR=ALL
) else (
  set FLAVOUR=%2
)
echo Flavour: %FLAVOUR%

set SETUP_PATH=.\pi-kitchen\000-noobs-setup
set BUILD_FLAVOUR_PROG=build_flavourRecipe.bat

echo Building Flavour(s)...
%SDCARD_TARGET%
cd %SETUP_PATH%
CALL %BUILD_FLAVOUR_PROG% %FLAVOUR%

echo Done!
echo #######################