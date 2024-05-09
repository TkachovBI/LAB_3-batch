@echo off
setlocal enabledelayedexpansion

REM Checking command line parameters
if "%~1"=="" (
    set "target_directory=%cd%"
) else (
    REM Checking the directory
    if not exist "%~1" (
        echo Directory "%~1" not found
        goto :help
    )
    set "target_directory=%~1"
)

REM Displaying contents of the directory and file sizes
echo Contents of directory %target_directory%:
dir /a /s %target_directory%

REM Displaying the size of all files in the directory
echo.
echo Total size of files in directory %target_directory%:
dir /s %target_directory% | find "File(s)"

REM Displaying hidden files separately
echo.
echo Hidden files in directory %target_directory%:
for /f "delims=" %%f in ('dir /b /a:h "%target_directory%"') do (
    echo %%f
)

exit /b 0

:help
echo Usage: %0 "[path_to_directory]"
echo.
echo Parameters:
echo    path_to_directory - The path to the directory you want to display
exit /b 1
