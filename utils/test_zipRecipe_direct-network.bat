set RECIPE_NAME=direct-network

set ZIP_PROG="..\utils\win-7zip\7z.exe"
set TARGET_DIR="pi-kitchen\%RECIPE_NAME%"
set TARGET_NAME=ingredients.zip
REM set TARGET_RECIPE=recipe_files.zip
set EXCLUDED="..\utils\excluded.txt"

cd ..\sdcard
%ZIP_PROG% a -r -xr@%EXCLUDED% %TARGET_DIR%\%TARGET_NAME% %TARGET_DIR%\*.*

pause