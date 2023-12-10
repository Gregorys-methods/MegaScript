@echo off

REM Specify the local version in the batch script
set "localVersion=0.1.2"

REM Fetch latest release information from GitHub API
for /f "tokens=2 delims=:," %%G in ('powershell -command "& { Invoke-RestMethod -Uri 'https://api.github.com/repos/Gregorys-methods/MegaScript/releases/latest' }" ^| findstr /C:"name"') do set "latestVersion=%%~G"
set "latestVersion=%latestVersion:~1%"

REM Compare versions
echo Latest Version: %latestVersion%
echo Local Version: %localVersion%

REM Compare the release names
if "%latestVersion%" GTR "%localVersion%" (
    echo Newer version found. Performing update...

    REM Rename the folder to "old" three levels up from this batch file
    pushd ..\..\..
    ren MegaScript old

    REM Change the download location to the renamed folder
    cd old
    REM Download the latest release archive from GitHub
    powershell -command "& { Invoke-WebRequest -Uri 'https://github.com/Gregorys-methods/MegaScript/releases/latest/download/MegaScript-main.zip' -OutFile 'MegaScript-main.zip' }"

    REM Extract the downloaded archive
if exist "MegaScript-main.zip" (
    echo Extracting update...
    powershell -command "& { Expand-Archive -Path '.\MegaScript-main.zip' -DestinationPath '.\' -Force }"
    del /q MegaScript-main.zip

    REM Run the updatefinish.bat script after extraction
    cd MegaScript-main\Scripts\Update
    call updatefinish.bat
) else (
    echo Update download failed.
)


    REM Go back to the original directory
    popd
) else (
    echo No update available.
)

pause
