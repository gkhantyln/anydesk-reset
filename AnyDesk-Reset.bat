@echo off
chcp 65001 > nul
mode con: cols=60 lines=15
color 0a

REM Determine the operating system architecture
if exist "C:\Program Files (x86)" (
    set ostype=64
) else (
    set ostype=32
)

REM Clear the console and display initial message
cls
echo Terminating Anydesk Process...

REM Terminate AnyDesk processes
for /f "tokens=1,2 delims= " %%A in ('tasklist /FI "IMAGENAME eq Anydesk.exe" /NH') do (
    taskkill /f /pid %%B >nul
)

REM Clear the console and display message
cls
echo Deleting Anydesk Configuration Files...

REM Backup and remove AnyDesk configuration files
c:
cd\
cd "C:\ProgramData\AnyDesk\"
if exist system.conf.backup del /f /q system.conf.backup
if exist service.conf.backup del /f /q service.conf.backup
rename system.conf system.conf.backup
rename service.conf service.conf.backup
cd\
rmdir /s /q "%appdata%\Anydesk"

REM Clear the console and display message
cls
echo Assigning New ID to Anydesk...

REM Start AnyDesk directory cleanup
if %ostype%==32 (
    set "pdir=C:\Program Files\AnyDesk"
) else (
    set "pdir=C:\Program Files (x86)\AnyDesk"
)

REM Clear the console and display message
cls
echo Starting Anydesk...

REM Launch AnyDesk application
start "" "%pdir%\AnyDesk.exe"

REM Clear the console and display completion message
cls
echo.
echo Anydesk operations completed successfully.
echo.
pause
