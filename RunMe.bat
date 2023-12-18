@echo off
setlocal EnableDelayedExpansion

REM Set the base path for scripts
set "scriptPath=Scripts"

REM Read the version number from Update.bat
for /f "tokens=2 delims==" %%a in ('findstr "localVersion=" "%scriptPath%\Update\Update.bat"') do set "version=%%a"

:MainMenu
cls

REM Display the title and version
echo          Gregory's Methods          
echo          Version: !version!
echo ----------------------------------------------
echo [U] ^> Check For Updates
echo [A] ^> Run All Scripts
echo.
echo Script Operations:
set "options[1]=Spotify"
set "options[2]=Wemod Pro"
set "options[3]=WinRar Activation"
set "options[4]=Windows Activation"
for /L %%i in (1,1,4) do (
    echo [%%i] ^> !options[%%i]!
)
echo.
echo System Options:
echo [H] ^> Help
echo [0] ^> Exit
echo.

:Input
set /p choice="Enter your choices separated by commas (e.g., 1,3,4) or A for all: "
if "%choice%"=="0" exit
if /I "%choice%"=="U" (
    echo Executing: Check For Updates
    start cmd /k "%scriptPath%\Update\Update.bat"
    goto EndScript
)
if /I "%choice%"=="A" set "choice=1,2,3,4"
if /I "%choice%"=="H" (
    echo Executing: Help
    REM Add your help command or script here
    goto EndScript
)

REM Remove spaces from input and append a comma at the end
set "choice=%choice: =%"
set "input=%choice%,"
:Loop
for /f "tokens=1* delims=," %%a in ("!input!") do (
    set "num=%%a"
    set "input=%%b"
    if "!num!"=="" goto EndScript

    echo Executing: !options[!num!]!
    call :ExecuteScript !num!
    if not "!input!"=="" goto Loop
)

:EndScript
echo.
echo Made by Gregory's Methods
pause
goto MainMenu

:ExecuteScript
if "%~1"=="1" start cmd /k "%scriptPath%\Spotify\Spotx.bat"
if "%~1"=="2" start cmd /k "%scriptPath%\Wemod\wemoddownload.bat"
if "%~1"=="3" start cmd /k "%scriptPath%\Winrar\Winrar.bat"
if "%~1"=="4" start cmd /k "%scriptPath%\Windows\win.bat"
REM Add more if conditions for each script number
goto :eof
