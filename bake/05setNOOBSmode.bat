REM www.pihardware.com Pi-Kitchen
REM This script will allow you to select how NOOBS will run.
REM 05setNOOBSmode target installsw runmode videomode flavour distro
echo #### Set NOOBS mode ####

REM Read in the command line inputs:
REM SDCARD_TARGET
if [%1] == [] (
  set SDCARD_TARGET=F:
) else (
  set SDCARD_TARGET=%1
)
echo SDCard Location: %SDCARD_TARGET%

REM NOOBS or PINN
if [%2] == [] (
  set INSTALLSW=NOOBS
) else (
  set INSTALLSW=%2
)
echo Install software: %INSTALLSW%

REM RUNMODE
if [%3] == [] (
  set RUNMODE=
) else (
  set RUNMODE=%3
  echo RUNMODE=%RUNMODE%
)

REM VIDEOMODE
if [%4] == [] (
  set VIDEOMODE=
) else (
  set VIDEOMODE=%4
  echo VIDEOMODE=%VIDEOMODE%
)

REM FLAVOUR
if [%5] == [] (
  set FLAVOUR=
) else (
  set FLAVOUR=%5
  echo FLAVOUR=%FLAVOUR%
)

set SETUP_PATH=\pi-kitchen\000-noobs-setup
set SWITCH_NOOBS_PROG=switchnoobs

echo Select install mode...
%SDCARD_TARGET%
cd %SETUP_PATH%
CALL %SWITCH_NOOBS_PROG% %INSTALLSW% %RUNMODE% %VIDEOMODE% %FLAVOUR%

echo Done!
echo #######################