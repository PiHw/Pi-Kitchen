@echo off
REM Create a list of the recipes available in the Pi-Kitchen (based on the directory names)
REM List list is used for generating the documentation and the combined recipe files (i.e. RaspbianPiKitchen_root.txt)

set RECIPE_PATH="..\..\pi-kitchen\"
set LIST=recipelist.txt

del %LIST%
echo #Ignore any recipes with # at the start of the line > %LIST%
setlocal enabledelayedexpansion
for /f %%i in ('dir %RECIPE_PATH% /b /on') do (
  set system=0
  if "%%i"=="_dev" set system=1
  if "%%i"=="_SETTINGS" set system=1
  if !system!==0 echo %%i>> %LIST%
)