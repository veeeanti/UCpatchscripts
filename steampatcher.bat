@echo off
setlocal 

set "emudll32=%~dp0\steam_api.dll"
set "targetdll32=%~dp1\steam_api.dll"
set "ogtarget32=%~dp1\steam_api_o.dll"
set "emudll64=%~dp0\steam_api64.dll"
set "targetdll64=%~dp1\steam_api64.dll"
set "ogtarget64=%~dp1\steam_api64_o.dll"
set "urlfile=%~dp0\UnionCrax.url"
set "blankshortcutmakerbat=%~dp0\Template Make Desktop Shortcut Bat.bat"
set "nfo=%~dp0\blankUNION.nfo"
set "genints32=%~dp0\generate_interfaces_x32.exe"
set "genints64=%~dp0\generate_interfaces_x64.exe"

if exist "%ogtarget32%" goto:32o
if exist "%ogtarget64%" goto:64o 
if exist "%targetdll32%" goto:32
if exist "%targetdll64%" goto:64
echo "Error: no steam dlls of either kind found! If this is a mistake, contact veeanti on discord or open an issue on the GitHub repo for this!"
endlocal
pause
exit

:32
ren "%targetdll32%" "steam_api_o.dll"
copy /Y "%emudll32%" "%targetdll32%"
"%genints32%" "%~dp1\steam_api_o.dll"
if exist "%targetdll64%" goto:64
goto:extrastuff

:64
ren "%targetdll64%" "steam_api64_o.dll"
copy /Y "%emudll64%" "%targetdll64%"
"%genints64%" "%~dp1\steam_api64_o.dll"
goto:extrastuff

:32o
echo "Warning: steam_api_o.dll found!"
pause
endlocal
exit

:64o
echo "Warning: steam_api64_o.dll found!"
pause
endlocal
exit

:extrastuff
copy /Y "%urlfile%" "%~dp1"
copy /Y "%blankshortcutmakerbat%" "%~dp1\create_shortcut_on_desktop.bat"
copy /Y "%nfo%" "%~dp1\UNION.nfo"
endlocal
exit
