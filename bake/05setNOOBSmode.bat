@echo off
REM This script will allow you to select how NOOBS will run.
REM 05setNOOBSmode target
echo #### Set NOOBS mode ####

REM Read in the command line inputs:
REM SDCARD_TARGET
if [%1] == [] (
  set SDCARD_TARGET=F:
) else (
  set SDCARD_TARGET=%1
)
echo SDCard Location: %SDCARD_TARGET%

set SETUP_PATH=.\pi-kitchen\000-noobs-setup
set SWITCH_NOOBS_PROG=switchnoobs.bat

echo Select NOOBS install mode...
%SDCARD_TARGET%
cd %SETUP_PATH%
CALL %SWITCH_NOOBS_PROG%

echo Done!
echo #######################