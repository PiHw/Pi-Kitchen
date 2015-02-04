
if %PROCESSOR_ARCHITECTURE%==x86 (
  echo 32 bit
  %~dp0/7zx32.exe %1 %2 %3 %4 %5 %6 %7 %8 %9 %10
) else (
  echo 64 bit
  %~dp0/7zx64.exe %1 %2 %3 %4 %5 %6 %7 %8 %9 %10
)