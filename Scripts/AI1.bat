@echo off

start "First Batch" cmd /c "cd /d %~dp0\Wemod && call wemoddownload.bat"
start "Second Batch" cmd /c "cd /d %~dp0\Winrar && call Winrar.bat"
start "Third Batch" cmd /c "cd /d %~dp0\Spotify && call Spotx.bat"

pause
