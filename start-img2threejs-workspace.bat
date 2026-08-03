@echo off
setlocal
set "DEST=%USERPROFILE%\Documents\GitHub\my-3d"

echo ============================================
echo   img2threejs workspace
echo ============================================
echo.
echo Work folder:
echo   %DEST%
echo.

if not exist "%DEST%" mkdir "%DEST%"
cd /d "%DEST%"

where claude >nul 2>&1
if errorlevel 1 goto noclaude

echo Opening Claude Code here...
echo.
echo Next, inside Claude Code:
echo   1) type /  and check that img2threejs shows up
echo   2) attach your object photo
echo   3) run:
echo      /img2threejs Rebuild this object as a Three.js model, keep the proportions, angles, and colours.
echo.
claude
exit /b 0

:noclaude
echo Could not find the "claude" command on PATH.
echo Opening the work folder in Explorer instead.
start "" "%DEST%"
echo.
echo Please open Claude Code yourself and point it to this folder:
echo   %DEST%
echo.
pause
exit /b 1
