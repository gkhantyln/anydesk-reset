### AnyDesk Automatic Refresh and Cleanup Script

This script terminates AnyDesk processes on a Windows operating system, backs up and deletes configuration files, and restarts AnyDesk with a new ID.

#### Usage

1. **Installation**

   Download or copy the script.

2. **Execution**

   - Open the script with a text editor and adjust settings as needed (e.g., modify the directory where AnyDesk is installed).
   - Run the script as an administrator (Right-click and select "Run as administrator").

3. **Notes**

   - Administrator rights may be required for the script to function properly.
   - Depending on where AnyDesk is installed (`C:\Program Files\AnyDesk` or `C:\Program Files (x86)\AnyDesk`), adjust the `pdir` variable in the script.

#### Example Usage

```bash
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

REM ... (Remaining part of the script)

pause
