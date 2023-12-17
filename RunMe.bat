@echo off
setlocal EnableDelayedExpansion

REM Set the base path for scripts
set "scriptPath=Scripts"

:MainMenu
cls

REM Display the title
echo          Gregory's Methods          
echo ----------------------------------------------

REM Define menu options
set "options[0]=Exit"
set "options[A]=Run All Scripts"
set "options[U]=Check For Updates"
set "options[1]=Spotify"
set "options[2]=Wemod Pro"
set "options[3]=WinRar Activation"
set "options[4]=Windows Activation"
REM Add more options as needed here.

set "options[H]=Help"

REM Display options
echo [U] ^> !options[U]!
echo [A] ^> !options[A]!
echo.
echo Script Operations:
for /L %%i in (1,1,10) do (  REM Change 10 to the number of scripts you have
    if defined options[%%i] echo [%%i] ^> !options[%%i]!
)
echo.
echo System Options:
echo [H] ^> !options[H]!
echo [0] ^> !options[0]!
echo.

:Input
set /p choice="Enter your choices separated by commas (e.g., 1,3,4) or A for all: "
if "%choice%"=="0" exit

REM Check for 'Run All' option
if /I "%choice%"=="A" set "choice=1,2,3,4"  REM Add all script numbers here

REM Remove spaces from input and append a comma at the end
set "choice=%choice: =%"
set "input=%choice%,"
:Loop
for /f "tokens=1* delims=," %%a in ("!input!") do (
    set "num=%%a"
    set "input=%%b"
    if "!num!"=="" goto MainMenu

    REM Check if the script exists for the selected number
    if not defined options[!num!] (
        echo Invalid choice: !num!
        if not "!input!"=="" goto Loop
        pause
        goto MainMenu
    )

    REM Execute the selected script
    echo Executing: !options[!num!]!
    call :ExecuteScript !num!
    if not "!input!"=="" goto Loop
)

echo.
echo Made by Gregory's Methods
pause
goto MainMenu

:ExecuteScript
if "%~1"=="U" start cmd /k "%scriptPath%\Update\Update.bat"
if "%~1"=="1" start cmd /k "%scriptPath%\Spotify\Spotx.bat"
if "%~1"=="2" start cmd /k "%scriptPath%\Wemod\wemoddownload.bat"
if "%~1"=="3" start cmd /k "%scriptPath%\Winrar\Winrar.bat"
if "%~1"=="4" start cmd /k "%scriptPath%\Windows\win.bat"
REM Add more if conditions for each script number
REM Example: if "%~1"=="5" start cmd /k "%scriptPath%\YourScript5.bat"
goto :eof
