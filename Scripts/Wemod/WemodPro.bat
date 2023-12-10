@echo off

REM Define the WeMod folder path
set "wemodFolder=%localappdata%\WeMod"

REM Check if the WeMod folder exists
if not exist "%wemodFolder%" (
    echo WeMod folder not found in %localappdata%.
    pause
    exit /b
)

REM Find the latest app version folder in the WeMod directory
for /d %%d in ("%wemodFolder%\app-*.*.*") do (
    set "targetFolder=%%d\resources"
)

REM Check if the target folder exists
if exist "%targetFolder%" (
    REM Check if the app.asar file exists in the target folder
    if exist "%targetFolder%\app.asar" (
        REM Stop the WeMod process (assuming the process name is WeMod.exe)
        taskkill /F /IM WeMod.exe
        timeout /t 2
        
        REM Copy the local app.asar to the target folder, overwriting the existing one
        copy /Y "app.asar" "%targetFolder%\app.asar"
        echo Copied updated app.asar from the local folder to the target folder.
        
        echo File replacement completed successfully.
    ) else (
        echo app.asar file not found in the target folder.
    )
) else (
    echo Target folder not found.
)

REM Open WeMod
start "" "%localappdata%\WeMod\WeMod.exe"

pause
