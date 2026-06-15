#!/bin/bash
set -euo pipefail

APP_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$APP_DIR"

echo "========================================"
echo "  跨境电商广告智能分析系统"
echo "  $(date)"
echo "========================================"

find_python() {
  for candidate in \
    "/opt/homebrew/bin/python3" \
    "/usr/local/bin/python3" \
    "/Library/Frameworks/Python.framework/Versions/3.12/bin/python3" \
    "/Library/Frameworks/Python.framework/Versions/3.11/bin/python3"
  do
    [ -x "$candidate" ] && echo "$candidate" && return 0
  done
  command -v python3 2>/dev/null || return 1
}

PYTHON_BIN="$(find_python || true)"
if [ -z "$PYTHON_BIN" ]; then
  echo ""
  echo "未检测到 Python 3。"
  echo "请先安装：https://www.python.org/downloads/"
  echo "Mac 安装后请勾选「Add Python to PATH」。"
  read -r -p "按回车键退出..."
  exit 1
fi

echo "Python: $("$PYTHON_BIN" --version)"
echo ""
echo "正在安装依赖（首次运行需联网，约 1~3 分钟）..."
"$PYTHON_BIN" -m pip install --upgrade pip -q
"$PYTHON_BIN" -m pip install -r requirements.txt -q

echo ""
echo "启动中 → http://localhost:8501"
echo "关闭本窗口即可停止。"
echo ""

"$PYTHON_BIN" -m streamlit run ad_analysis_app.py \
  --server.headless false \
  --browser.gatherUsageStats false
