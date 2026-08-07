@echo off
setlocal enabledelayedexpansion
pushd "%~dp0"

echo ============================================
echo    MAC - Multi-Agent CAD  (Web UI launcher)
echo ============================================
echo.

set "REPO_DIR=%~dp0repo"
set "ENV_NAME=multi_agent_cad"
set "KEY_FILE=%~dp0apikey.txt"

REM ------------------------------------------------------------------
REM 1. git
REM ------------------------------------------------------------------
where git >nul 2>nul
if errorlevel 1 (
  echo [ERROR] git not found. Install Git for Windows first:
  echo         https://git-scm.com/download/win
  pause & popd & exit /b 1
)

REM ------------------------------------------------------------------
REM 2. conda  (PATH, then common install locations)
REM ------------------------------------------------------------------
set "CONDA_BAT="
where conda >nul 2>nul && set "CONDA_BAT=conda"
if not defined CONDA_BAT (
  for %%D in (
    "%USERPROFILE%\miniconda3"
    "%USERPROFILE%\anaconda3"
    "%USERPROFILE%\AppData\Local\miniconda3"
    "%USERPROFILE%\AppData\Local\anaconda3"
    "%LOCALAPPDATA%\miniforge3"
    "C:\ProgramData\miniconda3"
    "C:\ProgramData\Anaconda3"
  ) do (
    if not defined CONDA_BAT (
      if exist "%%~D\Scripts\conda.exe" (
        set "CONDA_BAT=%%~D\Scripts\conda.exe"
        set "PATH=%%~D;%%~D\Scripts;%%~D\Library\bin;!PATH!"
      )
    )
  )
)
if not defined CONDA_BAT (
  echo [ERROR] conda not found.
  echo         MAC needs conda on Windows - trimesh / rtree / OCP pip wheels
  echo         are unreliable here. Install Miniconda, then run this again:
  echo         https://docs.conda.io/en/latest/miniconda.html
  pause & popd & exit /b 1
)
echo Using conda: %CONDA_BAT%

REM ------------------------------------------------------------------
REM 3. clone or update the repository
REM ------------------------------------------------------------------
if not exist "%REPO_DIR%\environment.yml" (
  echo.
  echo Cloning Multi-Agent-CAD ...
  git clone --depth 1 https://github.com/Pan-Chera/Multi-Agent-CAD.git "%REPO_DIR%"
  if errorlevel 1 (
    echo [ERROR] git clone failed. Check your network / proxy.
    pause & popd & exit /b 1
  )
) else (
  echo Repository OK.
)

REM ------------------------------------------------------------------
REM 4. conda environment
REM ------------------------------------------------------------------
call "%CONDA_BAT%" env list | findstr /R /C:"^%ENV_NAME% " >nul 2>nul
if errorlevel 1 (
  echo.
  echo Creating conda environment "%ENV_NAME%" - this takes 5-15 minutes ...
  call "%CONDA_BAT%" env create -f "%REPO_DIR%\environment.yml"
  if errorlevel 1 (
    echo [ERROR] conda env create failed. See messages above.
    pause & popd & exit /b 1
  )
) else (
  echo Conda environment OK.
)

REM ------------------------------------------------------------------
REM 5. package check  (only install when something is missing)
REM ------------------------------------------------------------------
call "%CONDA_BAT%" run -n %ENV_NAME% python -c "import multi_agent_cad, fastapi, uvicorn, build123d, langgraph" 1>nul 2>nul
if errorlevel 1 (
  echo.
  echo Installing MAC and Web UI dependencies ...
  pushd "%REPO_DIR%"
  call "%CONDA_BAT%" run -n %ENV_NAME% --no-capture-output python -m pip install -e ".[web]"
  set "INSTALL_ERR=!errorlevel!"
  popd
  if not "!INSTALL_ERR!"=="0" (
    echo [ERROR] Package install failed. Check network or run as Administrator.
    pause & popd & exit /b 1
  )
) else (
  echo Packages OK.
)

REM ------------------------------------------------------------------
REM 6. API key
REM ------------------------------------------------------------------
if not defined DASHSCOPE_API_KEY (
  if exist "%KEY_FILE%" (
    for /f "usebackq delims=" %%K in ("%KEY_FILE%") do set "DASHSCOPE_API_KEY=%%K"
  )
)
if not defined DASHSCOPE_API_KEY (
  echo.
  echo No API key found. MAC needs an OpenAI-compatible API key
  echo   ^(OpenAI / DeepSeek / Gemini / DashScope-Qwen / OpenRouter^).
  echo Leave blank to skip if you use a local Ollama endpoint.
  set /p "DASHSCOPE_API_KEY=Paste API key: "
  if not "!DASHSCOPE_API_KEY!"=="" (
    echo !DASHSCOPE_API_KEY!> "%KEY_FILE%"
    echo Key saved to apikey.txt - keep this file private, do not commit it.
  )
)
set "OPENAI_API_KEY=%DASHSCOPE_API_KEY%"

REM ------------------------------------------------------------------
REM 7. launch
REM ------------------------------------------------------------------
echo.
echo Launching Web UI on http://localhost:8000
echo Press Ctrl+C in this window to stop the server.
echo.
start "" "http://localhost:8000"
pushd "%REPO_DIR%"
call "%CONDA_BAT%" run -n %ENV_NAME% --no-capture-output python -m multi_agent_cad.web
set "RUN_ERR=%errorlevel%"
popd
if not "%RUN_ERR%"=="0" (
  echo.
  echo The server reported an error. See messages above.
  pause
)
popd
endlocal
