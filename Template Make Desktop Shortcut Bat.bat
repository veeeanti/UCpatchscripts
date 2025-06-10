@echo off
set SCRIPT="%TEMP%\makeshortcut.vbs"
set "cd=%~dp0"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%

echo sLinkFile = "%USERPROFILE%\Desktop\[Game Name Here].lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%cd%\[Game Exe Name Here].exe" >> %SCRIPT%
:: echo oLink.WorkingDirectory = "%cd%" >> %SCRIPT%
:: echo oLink.Arguments = "" >> %SCRIPT%
echo oLink.IconLocation =  "%cd%\icon.ico" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript %SCRIPT%

del %SCRIPT%