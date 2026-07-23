@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo ============================================
echo   一鍵上傳 Functional-reading 到 GitHub
echo ============================================
echo.

REM 檢查是否為 git repo
git rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 (
  echo [錯誤] 這個資料夾不是 git repo，無法上傳。
  echo.
  pause
  exit /b 1
)

echo [1/3] 加入所有變更...
git add -A

echo [2/3] 建立 commit...
git commit -m "更新內容 %date% %time%"
if errorlevel 1 (
  echo   （沒有新變更需要 commit，直接嘗試 push）
)

echo [3/3] 推送到 GitHub...
git push
if errorlevel 1 (
  echo.
  echo [失敗] push 沒有成功。常見原因：
  echo   - 尚未登入 GitHub（第一次會跳出登入視窗，請完成登入後再跑一次）
  echo   - 網路問題
  echo.
  pause
  exit /b 1
)

echo.
echo ============================================
echo   完成！網站約 1-2 分鐘後更新：
echo   https://jzx0930.github.io/Functional-reading/
echo ============================================
echo.
pause
