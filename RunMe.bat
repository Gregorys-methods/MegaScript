@echo off
setlocal EnableDelayedExpansion

REM Function to center text
set "title=Gregory's Methods"
echo %title%

REM Display options with user-defined text
echo [U] ^> Check For Updates
echo.
echo [1] ^> Run All Scripts
echo [2] ^> Spotify
echo [3] ^> Wemod Pro 
echo [4] ^> WinRar Activation
echo [5] ^> Windows Activation
echo.

REM Take user input
set /p choice="Enter the number of what you want to run: "

REM Execute the selected batch file (adjust the path accordingly)
if /I "%choice%"=="1" (
    start cmd /k "Scripts\AI1.bat"
) else if /I "%choice%"=="2" (
    start cmd /k "Scripts\Spotify\Spotx.bat"
) else if /I "%choice%"=="3" (
    start cmd /k "Scripts\Wemod\wemoddownload.bat"
) else if /I "%choice%"=="4" (
    start cmd /k "Scripts\Winrar\Winrar.bat"
) else if /I "%choice%"=="5" (
    start cmd /k "Scripts\Windows\win.bat""
) else if /I "%choice%"=="U" (
    start cmd /k "Scripts\Update\Update.bat""
) else (
    echo Invalid choice. Please select a valid option.
)

REM Footer
echo.
echo Made by Gregory's Methods
pause
