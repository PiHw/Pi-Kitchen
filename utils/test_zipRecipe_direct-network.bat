set RECIPE_NAME=001-direct-network

set ZIP_PROG="..\utils\win-7zip\7z.exe"
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

pause