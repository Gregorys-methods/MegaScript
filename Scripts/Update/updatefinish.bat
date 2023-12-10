@echo off
cd ..\..

call RunMe.bat

cd ..\..\..

if exist old (
    rmdir /s /q old
    echo Folder "old" has been deleted.
) else (
    echo Folder "old" not found.
)

pause
