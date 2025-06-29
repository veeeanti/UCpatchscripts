@echo off
setlocal

:: This is for the Nemirtingas Epic Emulator.

set "emuEOSdll32=%~dp0\EOSSDK-Win32-Shipping.dll"
set "targetEOSdll32=%~dp1\EOSSDK-Win32-Shipping.dll"
set "origEOSdll32=%~dp1\EOSSDK-Win32-Shipping_o.dll"
set "emuEOSdll64=%~dp0\EOSSDK-Win64-Shipping.dll"
set "targetEOSdll64=%~dp1\EOSSDK-Win64-Shipping.dll"
set "origEOSdll64=%~dp1\EOSSDK-Win64-Shipping_o.dll"
set "urlfile=%~dp0\UnionCrax.url"
set "nfo=%~dp0\blankUNION.nfo"

if exist %origEOSdll32% goto:32o
if exist %origEOSdll64% goto:64o
if exist %targetEOSdll32% goto:32
if exist %targetEOSdll64% goto:64

:32
ren "%targetEOSdll32%" EOSSDK-Win32-Shipping_o.dll
copy /Y "%emuEOSdll32%" %targetEOSdll32%
if exist %targetEOSdll64% goto:64
goto:extrastuff

:64
ren "%targetEOSdll64%" EOSSDK-Win64-Shipping_o.dll
copy /Y "%emuEOSdll64%" %targetEOSdll64%
goto:extrastuff

:extrastuff
copy /Y "%urlfile%" "%~dp1"
copy /Y "%nfo%" "%~dp1\UNION.nfo"
endlocal
exit

:32o
echo Warning! EOSSDK-Win32-Shipping_o.dll already exists here! 
pause
endlocal
exit

:64o
echo Warning! EOSSDK-Win64-Shipping_o.dll already exists here!
pause
endlocal
exit
