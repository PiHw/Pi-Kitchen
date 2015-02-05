@echo off
REM www.pihardware.com Pi-Kitchen
REM This script will extract the NOOBS setup files from the zip file.
REM Command line:
REM 01extractNOOBS target noobssource noobsconfig
echo #### Extract NOOBS ####

REM Read in the command line inputs:
REM SDCARD_TARGET
if [%1] == [] (
  set SDCARD_TARGET=F:
) else (
  set SDCARD_TARGET=%1
)
echo SDCard Location: %SDCARD_TARGET%

REM NOOBS_SOURCE
if [%2] == [] (
  set NOOBS_SOURCE=..\..\..\NOOBS_v1_3_12.zip
) else (
  set NOOBS_SOURCE=%2
)
echo NOOBS Source: %NOOBS_SOURCE%

REM NOOBSCONFIG_SOURCE
if [%3] == [] (
  set NOOBSCONFIG_SOURCE=..\..\..\noobsconfig.zip
) else (
  set NOOBSCONFIG_SOURCE=%3
)
echo NOOBS Config Source: %NOOBSCONFIG_SOURCE%

set ZIP_PROG=..\..\Pi-Kitchen-master\utils\win-7zip\7z.exe

REM Extract NOOBS
echo Extracting NOOBS...
%ZIP_PROG% x %NOOBS_SOURCE% -o%SDCARD_TARGET%\ -y
echo Extracting NOOBS Config...
%ZIP_PROG% x %NOOBSCONFIG_SOURCE% -o%SDCARD_TARGET%\ -y
echo Done!

echo #######################