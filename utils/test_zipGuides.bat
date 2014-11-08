set GUIDE_LIST=QuickStart,GettingStarted,CreatingFlavours,AutomaticInstallation,AutomaticInstallationWithData

set ZIP_PROG="..\..\utils\win-7zip\7z.exe"
set SOURCE_DIR=guides
set TARGET_DIR=..

for %%A in (%GUIDE_LIST%) do (
  echo Processing guide: %%A

  cd ..\%SOURCE_DIR%\%%A
  del %TARGET_DIR%\%%A.zip
  %ZIP_PROG% a -r %TARGET_DIR%\%%A.zip *.*
  cd ..\..\utils
)
pause