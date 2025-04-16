@echo off
:: Check for administrator privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Display warning and prompt for confirmation
echo WARNING: This script will modify your system PATH environment variable.
echo It will add 'C:\tools' to the PATH, which may affect system behavior.
echo Do you want to continue? (Y/N)
set /p user_input=
if /i not "%user_input%"=="Y" (
    echo Operation canceled by the user.
    pause
    exit /b 1
)

set "TOOLS_DIR=C:\tools"
set "C_EXE=c.exe"
set "C_EXE_PATH=%~dp0%C_EXE%"

:: Check if c.exe exists in the current directory
if not exist "%C_EXE_PATH%" (
    echo Error: %C_EXE% not found in the current directory.
    echo Please ensure %C_EXE% is located in the same directory as this script.
    pause
    exit /b 1
)

:: Create C:\tools directory if it doesn't exist
if not exist "%TOOLS_DIR%" (
    mkdir "%TOOLS_DIR%"
    if errorlevel 1 (
        echo Error: Failed to create %TOOLS_DIR%.
        pause
        exit /b 1
    )
)

:: Copy c.exe to C:\tools
copy /Y "%C_EXE_PATH%" "%TOOLS_DIR%\"
if errorlevel 1 (
    echo Error: Failed to copy %C_EXE% to %TOOLS_DIR%.
    pause
    exit /b 1
)

:: Check if C:\tools is in the system PATH
set "CURRENT_PATH="
for /f "tokens=2*" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path 2^>nul') do set "CURRENT_PATH=%%B"

echo %CURRENT_PATH% | find /I "%TOOLS_DIR%" >nul
if errorlevel 1 (
    :: C:\tools not found in PATH, so add it
    setx Path "%CURRENT_PATH%;%TOOLS_DIR%" /M
    if errorlevel 1 (
        echo Error: Failed to add %TOOLS_DIR% to the system PATH.
        pause
        exit /b 1
    ) else (
        echo Successfully added %TOOLS_DIR% to the system PATH.
    )
) else (
    echo %TOOLS_DIR% is already in the system PATH.
)

echo Setup completed successfully.
pause
