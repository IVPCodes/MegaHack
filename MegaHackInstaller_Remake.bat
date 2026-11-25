@echo off
set "set_path=%userprofile%\AppData\Local\absolllute.megahack\"
cd %userprofile%\Appdata\Local\
if not exist "absolllute.megahack" mkdir absolllute.megahack
cd absolllute.megahack
if not exist "licence" curl -L -O https://file.garden/agd4U_jWMlJVLqjq/license
title MegaHack Installer
:menu
cls
echo ------------------------------------
echo          MegaHack Installer
echo ------------------------------------
echo                discord.gg/3Vtf6AMqh3
echo(
echo Which version do you want MegaHack to be installed in?
echo [1] 2.2091 (MegaHack 9.2.0)
echo [2] 2.2081 (MegaHack 9.1.3)
set /p version=: 
if "%version%"=="1" set "runversion=2.2091"
if "%version%"=="2" set "runversion=2.2081"
if "%runversion%"=="2.2091" goto new
if "%runversion%"=="2.2081" goto old
goto menu
:new
cls
echo Searching for game installation.
timeout /t 1 /nobreak >nul
echo Searching for game installation. .
timeout /t 1 /nobreak >nul
echo Searching for game installation. . .
echo(
if exist "%ProgramFiles(x86)%\Steam\steamapps\common\Geometry Dash\GeometryDash.exe" (set "steam=true" & echo Steam Install found!) else (set "steam=false" & echo Steam Install not found.)
if exist "%ProgramFiles%\Epic Games\GeometryDash\GeometryDash.exe" (set "epic=true" & echo Epic Games Install found!) else (set "epic=false" & echo Epic Games Install not found.)
if "%steam%"=="true" if "%epic%"=="true" goto both
if "%steam%"=="true" goto steam
if "%epic%"=="true" goto epic
:noinstall
cls
echo Steam Geometry Dash not found.
echo Epic Games Geometry Dash not found.
echo Please enter your game directory manually.
set /p gamedir=: 
if exist "%gamedir%" (
	cd /d "%gamedir%"
	if exist "GeometryDash.exe" echo Geometry Dash found! & set "gdfound=%gamedir%"
)
if "%gdfound%"=="%gamedir%" (goto crackedcontinue) else (echo Geometry Dash not found. & pause & goto noinstall)
goto noinstall
:crackedcontinue
cls
if exist "%gamedir%\GeodeUpdater.exe" goto skipgeodecracked
if not exist "%gamedir%\GeodeUpdater.exe" start https://github.com/geode-sdk/geode/releases/download/v6.0.0/geode-installer-v6.0.0-win.exe
:nsda
cls
echo Please restart the script once you installed Geode.
goto nsda
:skipgeodecracked
cls
cd %gamedir%
if not exist "geode" (mkdir geode) else (cd "geode")
if not exist "mods" (mkdir mods) else (cd "mods")
curl -L -O https://file.garden/agd4U_jWMlJVLqjq/absolllute.installer.geode >nul
curl -L -O https://file.garden/agd4U_jWMlJVLqjq/absolllute.megahack.geode >nul
tasklist | findstr /i /c:"GeometryDash.exe" >nul
if %errorlevel%==0 taskkill /F /IM GeometryDash.exe >nul 2>&1
timeout /t 1 /nobreak >nul
echo Have Fun!
start "" "%gamedir%\GeometryDash.exe"
pause
exit
:steam
cls
cd "%ProgramFiles(x86)%\Steam\steamapps\common\Geometry Dash"
cd geode
if exist "mods" (cd mods) else (mkdir mods)
curl -L -O https://file.garden/agd4U_jWMlJVLqjq/absolllute.installer.geode >nul
curl -L -O https://file.garden/agd4U_jWMlJVLqjq/absolllute.megahack.geode >nul
tasklist | findstr /i /c:"GeometryDash.exe" >nul
if %errorlevel%==0 taskkill /F /IM GeometryDash.exe >nul 2>&1
timeout /t 1 /nobreak >nul
echo Have Fun!
start "" "%ProgramFiles(x86)%\Steam\steamapps\common\Geometry Dash\GeometryDash.exe"
pause
exit
:epic
cls
cd "%ProgramFiles%\Epic Games\GeometryDash"
if not exist "geode" (mkdir geode) else (cd "geode")
if not exist "mods" (mkdir mods) else (cd "mods")
curl -L -O https://file.garden/agd4U_jWMlJVLqjq/absolllute.installer.geode >nul
curl -L -O https://file.garden/agd4U_jWMlJVLqjq/absolllute.megahack.geode >nul
tasklist | findstr /i /c:"GeometryDash.exe" >nul
if %errorlevel%==0 taskkill /F /IM GeometryDash.exe >nul 2>&1
timeout /t 1 /nobreak >nul
echo Have Fun!
start "" "%ProgramFiles%\Epic Games\GeometryDash\GeometryDash.exe"
pause
exit
:both
cls
echo ------------------------------------
echo          MegaHack Installer
echo ------------------------------------
echo                discord.gg/3Vtf6AMqh3
echo(
echo Steam or Epic Games?
echo [1] Steam
echo [2] Epic Games
set /p both=: 
if "%both%"=="1" goto steam
if "%both%"=="2" goto epic
goto both
:old
cls
cd %userprofile%\desktop
curl -L -O https://file.garden/agd4U_jWMlJVLqjq/MH.zip >nul
echo Extract the "MH.zip" file on your desktop and execute the .exe file
pause
exit
