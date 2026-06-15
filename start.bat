@echo off
setlocal
cd /d "%~dp0"

echo ========================================
echo   跨境电商广告智能分析系统
echo ========================================

set "PYTHON_BIN="
where python >nul 2>nul && set "PYTHON_BIN=python"
if not defined PYTHON_BIN (
    where py >nul 2>nul && set "PYTHON_BIN=py -3"
)

if not defined PYTHON_BIN (
    echo.
    echo 未检测到 Python 3。
    echo 请先安装：https://www.python.org/downloads/
    echo 安装时务必勾选 "Add python.exe to PATH"。
    echo.
    pause
    exit /b 1
)

echo Python: %PYTHON_BIN%
%PYTHON_BIN% --version
if errorlevel 1 (
    echo Python 不可用，请重新安装 Python。
    pause
    exit /b 1
)

echo.
echo 正在安装依赖（首次运行需联网，约 1~3 分钟）...
%PYTHON_BIN% -m pip install --upgrade pip -q
%PYTHON_BIN% -m pip install -r requirements.txt -q
if errorlevel 1 (
    echo 依赖安装失败，请检查网络后重试。
    pause
    exit /b 1
)

echo.
echo 启动中 -^> http://localhost:8501
echo 关闭本窗口即可停止。
echo.

%PYTHON_BIN% -m streamlit run ad_analysis_app.py --server.headless false --browser.gatherUsageStats false
pause
