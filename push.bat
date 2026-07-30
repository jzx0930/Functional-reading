@echo off
cd /d "%~dp0"
echo ============================================
echo   Upload Functional-reading to GitHub
echo ============================================
echo.

git rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 goto notrepo

echo [1/3] Staging changes...
git add -A

echo [2/3] Committing...
git commit -m "update site"

echo [3/3] Pushing to GitHub...
git push
if errorlevel 1 goto pushfail

echo.
echo ============================================
echo   Done. Site updates in 1-2 minutes:
echo   https://jzx0930.github.io/Functional-reading/
echo ============================================
echo.
pause
exit /b 0

:notrepo
echo [ERROR] This folder is not a git repository.
echo.
pause
exit /b 1

:pushfail
echo.
echo [FAILED] push did not succeed. Common causes:
echo   - Not logged in yet: if a GitHub login window popped up,
echo     finish the login, then double-click this file again.
echo   - Network issue.
echo.
pause
exit /b 1
