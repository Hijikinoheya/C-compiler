@echo off
setlocal enabledelayedexpansion

REM ヘルプ表示
for %%A in (%*) do (
    if "%%~A"=="-h" goto :help
    if "%%~A"=="--help" goto :help
)

if "%~1"=="" (
    goto :help
)

REM ソースファイルとオプションの取得
set "src="
set "options="
set "compiler=gcc"

for %%A in (%*) do (
    set "arg=%%~A"
    set "ext=%%~xA"
    if /I "!ext!"==".c" (
        set "src=%%~A"
        set "compiler=gcc"
    ) else if /I "!ext!"==".cpp" (
        set "src=%%~A"
        set "compiler=g++"
    ) else (
        set "options=!options! %%~A"
    )
)

if not defined src (
    echo Error: No .c or .cpp file provided.
    pause
    goto :eof
)

if not exist "%src%" (
    echo Error: File "%src%" does not exist.
    pause
    goto :eof
)

REM ファイル名の取得
for %%F in ("%src%") do (
    set "name=%%~nF"
)

REM コンパイル
echo Compiling "%src%" with !compiler! and options: !options!
%compiler% "%src%" -o "%name%.exe" !options!
if errorlevel 1 (
    echo.
    echo Compilation failed.
    echo.
    pause
) else (
    echo Successfully compiled to "%name%.exe"
    echo.
    echo Created by Team Hijikinoheya
)
exit /b

:help
echo Usage: c [source_file.c or .cpp] [optimization flags] [extra options]
echo.
echo Supports both C (.c) and C++ (.cpp) files.
echo.
echo Optimization Options:
echo   -O0   No optimization (default in gcc, good for debugging)
echo   -O1   Some optimization
echo   -O2   Balanced optimization [Recommended]
echo   -O3   Aggressive optimization (may increase size)
echo   -Os   Optimize for size
echo.
echo Example:
echo   c hello.c -O2
echo   c program.cpp -O3 -Wall -lm
echo.
echo Drag-and-drop also supported.
echo.
echo Created by Team Hijikinoheya
pause
