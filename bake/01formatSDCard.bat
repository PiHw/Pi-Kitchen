@echo off
REM This script will start the SDFormatter program to clear the SDCard.
REM Command line:
REM 01formatSDCard target sdformatterprog
REM SDCARD_TARGET
echo #### Format SDCard ####
if [%1] == [] (
  set SDCARD_TARGET=F:
) else (
  set SDCARD_TARGET=%1
)

REM FORMAT_SDCARD_PROG
if [%2] == [] (
  set FORMAT_SDCARD_PROG=G:\_Apps\SDFormatter\SDFormatter.exe
) else (
  set FORMAT_SDCARD_PROG=%2
)

echo SDCard Location: %SDCARD_TARGET%
echo NOTE: Make sure you set "Format Size Adjustment"
echo SDCard Formatter Program: %FORMAT_SDCARD_PROG%

REM Run SDFormatter
CALL %FORMAT_SDCARD_PROG%

echo #######################