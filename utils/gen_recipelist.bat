@echo off;
REM Create a list of the recipes available in the Pi-Kitchen (based on the directory names)
REM List list is used for generating the documentation and the combined recipe files (i.e. RaspbianPiKitchen_root.txt)
REM Current directory of this batch file given by %~dp0

set NOOBS_SETUP_PATH="..\sdcard\pi-kitchen\000-noobs-setup\_recipelist"
set LIST=recipelist.txt

cd %NOOBS_SETUP_PATH%

CALL gen_recipelist.bat
copy %LIST% "%~dp0%LIST%" /Y