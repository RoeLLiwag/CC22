@echo off
echo Initiating shutdown sequence...
timeout /t 60 /nobreak >nul
echo Type 'cancel' to abort the shutdown.
set /p cancel=
if "%cancel%"=="cancel" (
    echo Shutdown cancelled.
    shutdown /a
) else (
    echo Shutting down now...
    shutdown /s /t 0
)
