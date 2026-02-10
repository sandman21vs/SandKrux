:: tools\easyeda2kicad.bat (SUBSTITUA O ARQUIVO INTEIRO)
@echo off
setlocal EnableExtensions EnableDelayedExpansion

title easyeda2kicad - downloader
cd /d "%~dp0"

echo.
echo ==============================
echo  easyeda2kicad - downloader
echo ==============================
echo.

choice /c 12 /n /m "Where to save? [1]=Default folder  [2]=Project folder : "
set "MODE=%ERRORLEVEL%"

set "USE_OUTPUT=0"
if "%MODE%"=="2" set "USE_OUTPUT=1"

if "%USE_OUTPUT%"=="1" (
    echo.
    echo Example path:
    echo   C:\Projects\MyPCB\kicad_lib
    echo.
    echo Tip: spaces are OK.
    echo.

    set "OUTPUT_DIR="
    set /p "OUTPUT_DIR=Type the destination folder path: "
    for /f "delims=" %%A in ("!OUTPUT_DIR!") do set "OUTPUT_DIR=%%~A"

    if not defined OUTPUT_DIR (
        echo Folder not provided.
        pause
        exit /b 1
    )

    if not exist "!OUTPUT_DIR!\." (
        echo.
        echo Folder does not exist:
        echo "!OUTPUT_DIR!"
        echo.
        choice /c YN /n /m "Create this folder? [Y]=Yes [N]=No : "
        if errorlevel 2 (
            echo Cancelled.
            pause
            exit /b 1
        )
        mkdir "!OUTPUT_DIR!" 2>nul
        if errorlevel 1 (
            echo Failed to create folder.
            pause
            exit /b 1
        )
    )
)

:LOOP
echo.
set "LCSC_ID="
set /p "LCSC_ID=Type the LCSC_ID (e.g. C2040) or 'e' to exit: "

if /I "!LCSC_ID!"=="e" exit /b 0
if not defined LCSC_ID (
    echo Please type an ID or 'e' to exit.
    pause
    goto LOOP
)

echo.
if "%USE_OUTPUT%"=="1" (
    echo Saving INSIDE: "!OUTPUT_DIR!"
    python -m easyeda2kicad --full --overwrite --lcsc_id=!LCSC_ID! --output "!OUTPUT_DIR!"
) else (
    echo Saving to easyeda2kicad default folder
    python -m easyeda2kicad --full --overwrite --lcsc_id=!LCSC_ID!
)

echo.
pause
goto LOOP
