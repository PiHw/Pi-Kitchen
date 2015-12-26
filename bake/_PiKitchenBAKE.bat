@echo off
REM www.pihardware.com Pi-Kitchen
REM _PiKitchenBAKE
REM Command line:
REM _PiKitchenBAKE target noobssource noobsconfig recipesource flavour
set BAKE_DRIVE=%~d0
set BAKE_PATH=%~p0

REM Setup defaults:
set SDCARD_TARGET=F:
set FORMAT_SDCARD_PROG="C:\Program Files (x86)\SD Formatter\SDFormatter.exe"
set NOOBS_SOURCE=..\NOOBS_v1_5_0.zip
set NOOBSCONFIG_SOURCE=..\noobsconfig.zip
set RECIPE_SOURCE=..\..\Pi-Kitchen-master\sdcard\pi-kitchen
set FLAVOUR=ALL

REM Check file locations:
if not exist %SDCARD_TARGET%\ GOTO settingerror
if not exist %FORMAT_SDCARD_PROG% GOTO settingerror
if not exist %NOOBS_SOURCE% GOTO settingerror
if not exist %NOOBSCONFIG_SOURCE% GOTO settingerror
if not exist %RECIPE_SOURCE% GOTO settingerror

REM 01formatSDCard target sdformatterprog
CALL 01formatSDCard.bat %SDCARD_TARGET% %FORMAT_SDCARD_PROG%
%BAKE_DRIVE%
cd %BAKE_PATH%
cls

REM 02extractNOOBS target noobssource noobsconfig
CALL 02extractNOOBS.bat %SDCARD_TARGET% %NOOBS_SOURCE% %NOOBSCONFIG_SOURCE%
%BAKE_DRIVE%
cd %BAKE_PATH%
cls

REM 03installRecipes target recipesource
CALL 03installRecipes %SDCARD_TARGET% %RECIPE_SOURCE%
%BAKE_DRIVE%
cd %BAKE_PATH%
cls

REM 04buildFlavours target flavour
CALL 04buildFlavours %SDCARD_TARGET% %FLAVOUR%
%BAKE_DRIVE%
cd %BAKE_PATH%
cls

REM 05setNOOBSmode target
CALL 05setNOOBSmode %SDCARD_TARGET%

GOTO end

:settingerror
echo ERROR Check your settings
echo ------------------------- 
if not exist %SDCARD_TARGET%\ echo SDCard expected at:                 %SDCARD_TARGET%
if not exist %FORMAT_SDCARD_PROG% echo SDFormatter program expected at:    %FORMAT_SDCARD_PROG%
if not exist %NOOBS_SOURCE% echo NOOBS ZIP file expected at:         %NOOBS_SOURCE%
if not exist %NOOBSCONFIG_SOURCE% echo noobsconfig expected at:            %NOOBSCONFIG_SOURCE%
if not exist %RECIPE_SOURCE% echo PiKitchen recipe files expected at: %RECIPE_SOURCE%
echo -------------------------


:end
echo All done!
pause