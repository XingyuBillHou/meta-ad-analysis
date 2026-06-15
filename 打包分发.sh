#!/bin/bash
# 在本文件夹内运行，生成可发给其他电脑的 zip 包
set -euo pipefail
APP_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$APP_DIR/.."
ZIP_NAME="ad-analysis-tool-$(date +%Y%m%d).zip"
zip -r "$ZIP_NAME" ad-analysis-tool \
  -x "*.DS_Store" -x "*__pycache__*" -x "*.pyc"
echo ""
echo "已生成: $APP_DIR/../$ZIP_NAME"
echo "将此 zip 发给其他电脑，解压后按「使用说明.txt」操作即可。"
