@echo off
setlocal enabledelayedexpansion

REM Define the source and archive directories
set "source_dir=C:\"
set "archive_dir=Z:\Archive"

REM Create the archive directory if it doesn't exist
if not exist "%archive_dir%" mkdir "%archive_dir%"

REM Log files processed
set "log_file=%archive_dir%\archived_files.log"

REM Find and move files older than 30 days to the archive directory
forfiles /p "%source_dir%" /s /m *.* /d -30 /c "cmd /c move @file \"%archive_dir%\" && echo @file >> \"%log_file%\""

REM Sort archived files by size
echo Sorting archived files by size...
for /f "tokens=*" %%A in ('dir "%archive_dir%" /b /o-s') do (
    echo %%A
)

REM Prompt the user for permission to delete large files
set /p delete_permission=Do you want to delete files larger than 1MB in the archive directory? (Y/N):

if /i "%delete_permission%"=="Y" (
    REM Delete files larger than 1MB
    forfiles /p "%archive_dir%" /s /m *.* /c "cmd /c if @fsize GTR 1048576 del @file"
    echo Large files deleted.
) else (
    echo No files were deleted.
)

endlocal
pause
