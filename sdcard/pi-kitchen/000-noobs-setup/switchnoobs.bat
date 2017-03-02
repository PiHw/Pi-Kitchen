REM Switch recovery.cmdline for NOOBS install and setup for auto/gui installs
REM
REM Will perform the following steps (if cmdline isn't set):
REM 0. Select software used for install (NOOBS/PINN)
REM 1. Select NOOBS run mode (Normal/GUI/Auto/Keep)
REM 2. Select video mode (for Normal, GUI and Auto only)
REM [N/A yet] 3. Select distro (for Auto only)
REM 4. Select flavour (for Auto only)
REM
REM switchnoobs.bat installsw runmode videomode flavour distro
echo CMD: switchnoobs.bat %1 %2 %3 %4 %5 %6

REM ==============================================
REM Read in the command line inputs:
REM INSTALLSW
if [%2] == [] (
  set INSTALLSW=ASK
) else (
  set INSTALLSW=%2
  echo INSTALLSW=%INSTALLSW%
)

REM RUNMODE
if [%3] == [] (
  set RUNMODE=ASK
) else (
  set RUNMODE=%3
  echo RUNMODE=%RUNMODE%
)

REM VIDEOMODE
if [%4] == [] (
  set VIDEOMODE=ASK
) else (
  set VIDEOMODE=%4
  echo VIDEOMODE=%VIDEOMODE%
)

REM FLAVOUR
if [%5] == [] (
  set FLAVOUR=ASK
) else (
  set FLAVOUR=%5
  echo FLAVOUR=%FLAVOUR%
)

REM DISTRO
if [%6] == [] (
  set DISTRO=ASK
) else (
  set DISTRO=%6
  echo DISTRO=%DISTRO%
)
REM ==============================================

pause

setlocal EnableDelayedExpansion

SET DISTRO=Raspbian
SET DEST="..\..\recovery.cmdline"
SET DISTRO_PATH=..\..\os\%DISTRO%
SET RUNMODE_LIST=(normal,gui,auto,exit)
SET VIDEOMODE_LIST=(HDMI,HDMIsafemode,PAL,NTSC,Default)
REM SET DATA_PARTITION=TRUE
SET DATA_PARTITION=FALSE

REM 0. Use NOOBS or PINN to install
if [%INSTALLSW%]==[ASK] (
  CALL :selectINSTALLSW
)
echo Selected install software = %INSTALLSW%
if [%INSTALLSW%]==[exit] goto end
CALL :applyINSTALLSW
cls

REM 1. Handle NOOBS runmode
if [%RUNMODE%]==[ASK] (
  CALL :selectRUNMODE
)
echo Selected Run mode = %RUNMODE%
if [%RUNMODE%]==[exit] goto end
CALL :applyRUNMODE
cls

REM 2. Handle video mode
if [%VIDEOMODE%]==[ASK] (
  CALL :selectVIDEOMODE
)
if %VIDEOMODE% LEQ 4 (
  CALL :applyVIDEOMODE
)
cls

REM 3. Handle select distro (for Auto only)
echo RUNMODE=%RUNMODE% FLAVOUR=%FLAVOUR%
pause
if [%RUNMODE%] NEQ [auto] (
  CALL :applyAllFlavours
  GOTO finishSetup
)
echo Distro Selected: %DISTRO%
REM 4. Select flavour (for Auto only)
if [%FLAVOUR%]==[ASK] (
  CALL :selectFLAVOUR
)
CALL :applyFLAVOUR
echo Flavour Selected: %FLAVOUR%
GOTO finishSetup


REM ==============================================
:selectINSTALLSW
REM We will just assume you are using NOOBS
set INSTALLSW=NOOBS
goto :eof
REM ==============================================

REM ==============================================
:applyINSTALLSW
echo Apply %INSTALLSW%
if [%INSTALLSW%]==[PINN] (
  set INSTALLSWPATH=_pinn
) else (
  set INSTALLSWPATH=_noobs
)

goto :eof
REM ==============================================

REM ==============================================
:selectRUNMODE
REM Use menu to get the required run mode
echo Select the required NOOBS Run Mode.
echo (normal) Starts OS normally - Press shift on boot to start NOOBS
echo (gui)    Starts the NOOBS GUI on next power up
echo (auto)   Automatically install the selected distribution and flavour
echo (exit)   Keep current settings and exit
echo.
set i=0
for %%a in %RUNMODE_LIST% do (
   set /A i+=1
   set "name[!i!]=%%a"
   echo !i! %%a
)
set lastOpt=%i%
:getOption
set /P "opt=Enter desired option: "
if %opt% gtr %lastOpt% (
   echo Invalid option
   goto getOption
)
echo Process %opt%:!name[%opt%]!
set RUNMODE=!name[%opt%]!
goto :eof
REM ==============================================

REM ==============================================
:applyRUNMODE
echo Apply %INSTALLSWPATH%\_cmdline\%RUNMODE%
SET SOURCE=".\%INSTALLSWPATH%\_cmdline\%RUNMODE%\recovery.cmdline"
REM Replace the recovery.cmdline file
copy %SOURCE% %DEST% /Y  >nul 2>&1
goto :eof
REM ==============================================

REM ==============================================
:selectVIDEOMODE
REM Use menu to get the required video mode
echo Select the required NOOBS Video Mode.
echo (HDMI)         Standard HDMI video ouput
echo (HDMIsafemode) High compatability HDMI output
echo (PAL)          Analogue video output (PAL mode) - Europe/Asia
echo (NTSC)         Analogue video output (NTSC mode) - US etc
echo (Default)      Use the default setting
echo.
set i=0
for %%a in %VIDEOMODE_LIST% do (
   set /A i+=1
   set "name[!i!]=%%a"
   echo !i! %%a
)
set lastOpt=%i%
:getOption
set /P "opt=Enter desired option: "
if %opt% gtr %lastOpt% (
   echo Invalid option
   goto getOption
)
echo Process %opt%:!name[%opt%]!
set VIDEOMODE=%opt%
goto :eof
REM ==============================================

REM ==============================================
:applyVIDEOMODE
echo Apply display mode:%VIDEOMODE%
REM Append the video mode to the recovery.cmdline file
for /F "delims=" %%a in (..\..\recovery.cmdline) do (
  echo|set /p=%%a display=%VIDEOMODE% > recovery.cmdline.new
)
copy recovery.cmdline.new %DEST% /Y  >nul 2>&1
del recovery.cmdline.new
goto :eof

REM ==============================================
:selectFLAVOUR
REM List all the flavour files in the _flavours directory to select from
set i=0
for /F "delims=" %%F in ('dir /b /o:n .\_flavours\*.json') do (
   set /A i+=1
   set "name[!i!]=%%~nF"
   echo !i! %%~nF
)
set lastOpt=%i%
:getOption
REM Get the selected option
set /P "opt=Select the flavour to install: "
if %opt% gtr %lastOpt% (
   echo Invalid option
   goto getOption
)
set FLAVOUR=!name[%opt%]!
echo Process !name[%opt%]!
goto:eof
REM ==============================================

REM ==============================================
:applyFLAVOUR
cls
echo Apply flavour:%FLAVOUR%
CALL gen_flavours.bat %FLAVOUR% %DISTRO%
REM - Rename os.json files in other os directories
for /r "..\..\os\" %%i in (os.json) do rename "%%i" "%%~ni.disabled" >nul 2>&1
REM Re-enable the selected distro
rename ..\..\os\%DISTRO%\os.disabled "os.json" >nul 2>&1
goto:eof
REM ==============================================

REM ==============================================
:applyAllFlavours
cls
SET FLAVOUR=ALL
CALL gen_flavours.bat %FLAVOUR% %DISTRO%

REM - Restore os.json files in all os directories
for /r "..\..\os\" %%i in (os.disabled) do rename "%%i" "%%~ni.json" >nul 2>&1
goto:eof
REM ==============================================

REM ==============================================
:applyIconsAndSlides
REM Add icon files:
echo Adding icon files...
REM If PNG files don't exist then copy (i.e. Provide icons for clean NOOBS setup)
for /r ".\_flavours\" %%i in (*.png) do (
  if not exist "..\..\os\%DISTRO%\%%~nxi" copy "%%i" "..\..\os\%DISTRO%\*.*" >nul 2>&1
  )
REM Add slides:
echo Adding slides files...
for /r ".\slides_vga\" %%i in (*.png) do (
  if not exist "..\..\os\%DISTRO%\slides_vga\%%~nxi" copy "%%i" "..\..\os\%DISTRO%\slides_vga\*.*" >nul 2>&1
  )
goto:eof
REM ==============================================

REM ==============================================
:applydatapart
if %DATA_PARTITION% == TRUE  (
  echo Adding data paration...
  REM Replace partitions.json file to include datapartition
  copy ".\%INSTALLSWPATH%\_partitions\datapartitions.json" ..\..\os\%DISTRO%\partitions.json /Y  >nul 2>&1
  REM Add data.tar.xz (if not present)
  if not exist "..\..\os\%DISTRO%\data.tar.xz" copy ".\%INSTALLSWPATH%\_partitions\data.tar.xz" "..\..\os\%DISTRO%\*.*" >nul 2>&1
) else (
  REM Replace partitions.json file
  copy ".\%INSTALLSWPATH%\_partitions\standardpartitions.json" ..\..\os\%DISTRO%\partitions.json /Y  >nul 2>&1
)
goto:eof
REM ==============================================

REM ==============================================
:finishSetup
cls
CALL :applydatapart
CALL :applyIconsAndSlides
goto end
REM ==============================================


:end
echo recovery.cmdline is:
echo %SOURCE%
type %DEST%
echo.
pause