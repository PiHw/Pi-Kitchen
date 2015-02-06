@echo off
REM This script will generate the three flavour recipes files for a given flavour.
REM i.e. RaspbianPiKitchen_root.txt, RaspbianPiKitchen_boot.txt, RaspbianPiKitchen_data.txt
REM
REM Allow command line inputs to determine the FLAVOUR, RECIPELIST and DISTRO (or to use defaults given in this file).
REM i.e. build_recipe RaspbianPiKitchen recipelist.txt Raspbian
REM
REM Supports flavour specific recipelist.txt files:
REM   i.e. RaspbianPiKitchen_recipelist.txt
REM
REM Supports flavour specific RECIPE_FILE_xxxx.txt files:
REM   i.e. RaspbianPiKitchen_RECIPE_FILE_root.txt

REM Read in the command line inputs:
REM FLAVOUR
if [%1] == [] (
  set FLAVOUR=ALL
) else (
  set FLAVOUR=%1
)

set FLAVOUR_SOURCE=_flavours/*.json

if "%FLAVOUR%" == "ALL" (
   for %%F in (%FLAVOUR_SOURCE%) do (
      set FLAVOUR=%%~nF
      call :CreateRecipe
   )
   goto TheEnd
)

:CreateRecipe
echo Flavour: %FLAVOUR%
REM RECIPELIST
if [%2] == [] (
  set RECIPELIST=%FLAVOUR%_recipelist.txt
) else (
  set RECIPELIST=%2
)
if not exist .\_recipelist\%RECIPELIST% (
  set RECIPELIST=recipelist.txt
)
echo Recipe List File: %RECIPELIST%

REM DISTRO
if [%3] == [] (
  set DISTRO=Raspbian
) else (
  set DISTRO=%3
)
echo Distribution: %DISTRO%

set DISTRO_PATH=..\..\os\%DISTRO%
set RECIPE_PATH=..\..\pi-kitchen
set HOME_PATH=/home/pi

:GenerateFileSet
set PART=root
call :GenerateFlavourRecipeFile
set PART=boot
call :GenerateFlavourRecipeFile
set PART=data
call :GenerateFlavourRecipeFile
goto TheEnd

:GenerateFlavourRecipeFile
REM Add header to the flavour recipe file:
REM Use date /T and time /T to provide current date and time
for /F "tokens=* usebackq" %%F in (`date /T`) do (
set DATE=%%F
)
for /F "tokens=* usebackq" %%F in (`time /T`) do (
set TIME=%%F
)
echo #Noobs config file for %FLAVOUR%_%PART% (%DATE% %TIME%)>%FLAVOUR%_%PART%.txt
echo #------------------------------------------------------------------->>%FLAVOUR%_%PART%.txt
echo #>>%FLAVOUR%_%PART%.txt
echo #Format is: filename destination attributes user group>>%FLAVOUR%_%PART%.txt
echo #Copy the Noobs config txt files to home directory for reference>>%FLAVOUR%_%PART%.txt
if "%PART%" == "root" (
  echo %FLAVOUR%_boot.txt %HOME_PATH%>>%FLAVOUR%_%PART%.txt
  echo %FLAVOUR%_root.txt %HOME_PATH%>>%FLAVOUR%_%PART%.txt
  echo %FLAVOUR%_data.txt %HOME_PATH%>>%FLAVOUR%_%PART%.txt
) else (
  echo %FLAVOUR%_boot.txt>>%FLAVOUR%_%PART%.txt
  echo %FLAVOUR%_root.txt>>%FLAVOUR%_%PART%.txt
  echo %FLAVOUR%_data.txt>>%FLAVOUR%_%PART%.txt
)
echo.>>%FLAVOUR%_%PART%.txt

::read %RECIPE_FILE% and loop through each line (ignore lines with #)
for /F "usebackq eol=# tokens=* delims=" %%A in (.\_recipelist\%RECIPELIST%) do (
   set RECIPE=%%A
   call :ProcessRecipeFileLine
)

REM Add footer to the flavour recipe file:
echo.>>%FLAVOUR%_%PART%.txt
echo #------------------------------------------------------------------->>%FLAVOUR%_%PART%.txt
echo #End>>%FLAVOUR%_%PART%.txt

REM Move to OS directory
move %FLAVOUR%_%PART%.txt %DISTRO_PATH%\%FLAVOUR%_%PART%.txt >nul 2>&1

goto :eof

:ProcessRecipeFileLine
echo Recipe: %RECIPE%
REM Check for flavour specific version of the recipe file.
set RECIPE_FILE=%FLAVOUR%_RECIPE_FILE_%PART%.txt
if not exist "%RECIPE_PATH%\%RECIPE%\%RECIPE_FILE%" (
  set RECIPE_FILE=RECIPE_FILE_%PART%.txt
)
echo Recipe File: %RECIPE_FILE%
type "%RECIPE_PATH%\%RECIPE%\%RECIPE_FILE%" >> %FLAVOUR%_%PART%.txt
echo.>>%FLAVOUR%_%PART%.txt
goto :eof



:TheEnd
