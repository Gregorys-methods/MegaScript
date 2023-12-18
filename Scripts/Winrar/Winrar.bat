@echo off

rem Define the path to the downloaded WinRAR installer
set "installer_path=%TEMP%\winrar-installer.exe"

rem Define the download URL for WinRAR
set "winrar_url=https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-623.exe"

rem Check if WinRAR is already installed
if exist "%ProgramFiles%\WinRAR\WinRAR.exe" (
    echo WinRAR is already installed.
) else (
    echo Installing WinRAR...

    rem Download WinRAR installer
    powershell -command "(New-Object System.Net.WebClient).DownloadFile('%winrar_url%', '%installer_path%')"

    rem Install WinRAR silently
    start /wait %installer_path% /S

    rem Clean up the installer
    del /q "%installer_path%"

    echo WinRAR has been downloaded and installed.
)

        rem Start WinRAR
start "" "%ProgramFiles%\WinRAR\WinRAR.exe"

REM Stop the WinRAR process
taskkill /F /IM WinRAR.exe

rem Define the path to the WinRAR directory in AppData\Roaming
set "winrar_dir=%APPDATA%\WinRAR"

rem Create the rarreg.key file with the specified content
(
    echo RAR registration data
    echo github
    echo github.com
    echo UID=7e126d6f3b191170d173
    echo 6412212250d17354ebeb24e4ac43da8712081903cb02cc0def927b
    echo b3928465d2c46e8a89a460b2bc467732c65d671b45040f9b59ccb7
    echo 2c3866605dde696792a15c76d6568c5c3aff06e709ac1bc67cf8af
    echo 3e4ec4e3a3b28093aa5da9f8f0ecd9a078609df854b927430d442d
    echo a0f46a8f3399becc6d1bd2a60408cf02d754d7eb788c5c3aff06e7
    echo 09ac1bc5bb6a7f8d2c21a1d5a519faeb9ae46965b1d9711c60971e
    echo ad9bbcaae81f7051f7f4300c1db1ceb7de59460666bd2062064260
) > "%winrar_dir%\rarreg.key"

echo rarreg.key file has been created in %winrar_dir%

rem Start WinRAR
start "" "%ProgramFiles%\WinRAR\WinRAR.exe"

pause
