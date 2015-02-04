@echo off
REM For info on "for /F" see http://www.computerhope.com/forhlp.htm

REM Read in the parameters for the target file and the define file
if [%1] == [] (
  set RECIPE_NAME=001-startup
) else (
  set RECIPE_NAME=%1
)
echo Recipe: %RECIPE_NAME%

set ZIP_PROG="..\utils\win-7zip\7z.bat"
set SOURCE_DIR="pi-kitchen\%RECIPE_NAME%"
set SOURCE_SETTINGS_DIR="pi-kitchen\_SETTINGS\%RECIPE_NAME%"
set TARGET_DIR="..\recipes"
set TARGET_NAME=%RECIPE_NAME%_INGREDIENTS.zip
REM set TARGET_RECIPE=recipe_files.zip
set EXCLUDED="..\utils\excluded.txt"

cd ..\sdcard
del %TARGET_DIR%\%TARGET_NAME%
%ZIP_PROG% a -r -xr@%EXCLUDED% %TARGET_DIR%\%TARGET_NAME% %SOURCE_DIR%\*.*

%ZIP_PROG% a -r -xr@%EXCLUDED% %TARGET_DIR%\%TARGET_NAME% %SOURCE_SETTINGS_DIR%\*.*
)


:TheEnd