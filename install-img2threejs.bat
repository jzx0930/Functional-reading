@echo off
cd /d "%~dp0"
echo ============================================
echo   Install img2threejs skill (Claude Code)
echo ============================================
echo.

where git >nul 2>&1
if errorlevel 1 goto nogit

set "DEST=%USERPROFILE%\.claude\skills\img2threejs"

if exist "%DEST%\.git" goto update

echo Cloning into:
echo   %DEST%
git clone https://github.com/img2threejs/img2threejs.git "%DEST%"
if errorlevel 1 goto clonefail
goto done

:update
echo Already installed. Updating...
pushd "%DEST%"
git pull
popd

:done
echo.
echo Checking Python (needs 3.10+)...
where python >nul 2>&1 && python --version
where py >nul 2>&1 && py --version
echo.
echo ============================================
echo   Done. In Claude Code, attach an object
echo   image and run:
echo   /img2threejs Rebuild this object as a
echo   Three.js model, keep proportions, angles,
echo   and colours.
echo ============================================
echo.
pause
exit /b 0

:nogit
echo [ERROR] git not found.
echo Install Git for Windows first: https://git-scm.com/download/win
echo.
pause
exit /b 1

:clonefail
echo.
echo [FAILED] clone did not succeed. Check network or GitHub login.
echo.
pause
exit /b 1
