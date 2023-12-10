
@echo off

REM Define the WeMod folder path
set "wemodFolder=%localappdata%\WeMod"

REM Check if the WeMod folder exists
if exist "%wemodFolder%\WeMod.exe" (
    echo WeMod is already installed in %localappdata%\WeMod.
    echo Proceeding to run another batch file...
    call "WemodPro.bat"  REM Replace with the path to your 2.bat file
    goto END_SCRIPT
) else (
    echo WeMod is not installed. Downloading WeMod from www.wemod.com/download/direct

    REM Change the directory to the folder where the batch file is located
    cd /d %~dp0

    REM Download the WeMod installer using BITSAdmin
    powershell -command "& {Invoke-WebRequest -Uri 'https://www.wemod.com/download/direct' -OutFile 'WeMod-Setup.exe'}"

    echo WeMod installer has been downloaded to the same folder as the batch file

    echo Launching the installer...
    start WeMod-Setup.exe

    echo Waiting for WeMod installation to start...

    :CHECK_INSTALLATION
    timeout /t 5 /nobreak >nul 2>&1

    REM Check if the WeMod folder exists after installation
    if exist "%wemodFolder%\WeMod.exe" (
        echo WeMod installation detected. Proceeding to run another batch file...
        timeout /t 5 >nul 2>&1
        call "WemodPro.bat"  REM Replace with the path to your 2.bat file
        goto END_SCRIPT
    ) else (
        echo WeMod installation not completed yet or file not found.
        echo Installation check completed.
        goto CHECK_INSTALLATION
    )
)

:END_SCRIPT
echo Installation check completed.
