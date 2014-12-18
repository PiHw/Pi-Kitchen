@echo off
REM Switch recovery.cmdline for NOOBS install and setup for auto/gui installs
SET DEST="..\..\recovery.cmdline"
SET DISTRO="..\..\os\Raspbian"
SET FLAVOUR=".\_flavours\flavours.json.auto"

echo Set NOOBS to run on next startup with one of the following options:
echo 1	Normal - Press shift on boot
echo 2	Automated Install (HDMI + PiKitchen)
echo 3	Automated Install (HDMI + PiKitchenDev)
echo 4	Automated Install (PAL + PiKitchen)
echo 5	Automated Install (PAL + PiKitchenDev)
echo 6	Run GUI (HDMI)
echo 7	Run GUI (PAL)
echo 0	Keep Setting



choice /C 12345670

IF %ERRORLEVEL% == 255 GOTO end
IF %ERRORLEVEL% == 1 GOTO normal
IF %ERRORLEVEL% == 2 GOTO auto-hdmi
IF %ERRORLEVEL% == 3 GOTO auto-hdmi-dev
IF %ERRORLEVEL% == 4 GOTO auto-sdtv
IF %ERRORLEVEL% == 5 GOTO auto-sdtv-dev
IF %ERRORLEVEL% == 6 GOTO gui-hdmi
IF %ERRORLEVEL% == 7 GOTO gui-sdtv
IF %ERRORLEVEL% == 8 GOTO end


GOTO end

:auto-hdmi
SET SOURCE=".\auto\recovery.cmdline"
GOTO auto

:auto-hdmi-dev
SET SOURCE=".\auto\recovery.cmdline"
SET FLAVOUR=".\_flavours\flavours.json.autodev"
GOTO auto

:auto-sdtv
SET SOURCE=".\auto-sdtv\recovery.cmdline"
GOTO auto

:auto-sdtv-dev
SET SOURCE=".\auto-sdtv\recovery.cmdline"
SET FLAVOUR=".\_flavours\flavours.json.autodev"
GOTO auto

:gui-hdmi
SET SOURCE=".\install\recovery.cmdline"
GOTO gui

:gui-sdtv
SET SOURCE=".\install-sdtv\recovery.cmdline"
GOTO gui

:normal
SET SOURCE=".\normal\recovery.cmdline"
GOTO gui

:auto
REM Change other files here for automatic install
REM 
REM NOTE:
REM Until recovery.cmdline file supports specifying an OS/Flavour from the cmdline.txt
REM we have to adjust the setup so only one option is available.

REM - Replace flavours.json with single flavour version
copy %FLAVOUR% %DISTRO%\flavours.json /Y >nul 2>&1

REM - Rename os.json files in other os directories
for /r "..\..\os\" %%i in (os.json) do rename "%%i" "%%~ni.disabled" >nul 2>&1
REM Re-enable the selected distro
rename %DISTRO%\os.disabled "os.json"

GOTO cmdline



:gui
REM Change other files here for GUI install
REM 
REM NOTE:
REM Until cmdline.txt file supports specifying an OS/Flavour from the cmdline.txt
REM we have to undo any changes made by the automatic installation option.

REM - Replace flavours.json with multi flavour version
SET FLAVOUR=".\_flavours\flavours.json.normal" 
copy %FLAVOUR% %DISTRO%\flavours.json /Y >nul 2>&1

REM - Restore os.json files in all os directories
for /r "..\..\os\" %%i in (os.disabled) do rename "%%i" "%%~ni.json" >nul 2>&1

GOTO cmdline



:cmdline
REM Replace the recovery.cmdline file
copy %SOURCE% %DEST% /Y  >nul 2>&1
REM If PNG files don't exist then copy (i.e. Provide icons for clean NOOBS setup)
for /r ".\_flavours\" %%i in (*.png) do (
  if not exist "%DISTRO%\%%~nxi" copy "%%i" "%DISTRO%\*.*" >nul 2>&1
  )

GOTO datapart

:datapart
REM Replace partitions.json file
copy ".\_flavours\partitions.json" %DISTRO% /Y  >nul 2>&1
REM Add data.tar.xz (if not present)
if not exist "%DISTRO%\data.tar.xz" copy ".\_flavours\data.tar.xz" "%DISTRO%\*.*" >nul 2>&1

GOTO end

:end
echo recovery.cmdline is:
type %DEST%
echo .
pause