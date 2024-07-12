@echo off
rem Open five websites
start "" "https://www.google.com"
start "" "https://www.bing.com"
start "" "https://www.yahoo.com"
start "" "https://www.duckduckgo.com"
start "" "https://www.github.com"

rem Launch Calculator
start calc.exe

rem Launch Notepad
start notepad.exe

rem Wait for 30 seconds before shutdown
timeout /t 30

rem Initiate system shutdown with a 60-second delay
shutdown /s /t 60

echo System will shut down in 60 seconds.
