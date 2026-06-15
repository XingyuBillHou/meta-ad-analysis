# 跨境电商广告投放智能分析系统

基于 Streamlit 的多渠道广告数据（Shopify / Google / Meta / AppLovin 等）日/周/月报 AI 分析工具。

## 在线部署（Streamlit Community Cloud）

1. 将本目录推送到 GitHub 仓库（见下方「推送到 GitHub」）。
2. 打开 [share.streamlit.io](https://share.streamlit.io/)，使用 GitHub 登录。
3. 点击 **New app**，选择仓库与分支：
   - **Main file path**: `ad_analysis_app.py`
   - **App URL**: 自定义子域名（可选）
4. 点击 **Deploy**，等待构建完成（约 1–3 分钟）。
5. （可选）在 **Settings → Secrets** 中配置大模型 Key，格式见 `.streamlit/secrets.toml.example`。

部署完成后，访问 `https://<你的app名>.streamlit.app` 即可使用。

## 推送到 GitHub

在本目录（`ad-analysis-tool`）执行：

```bash
git init
git add .
git commit -m "Initial commit: ad analysis Streamlit app"
gh repo create meta-ad-analysis --public --source=. --remote=origin --push
```

若仓库已存在，改为：

```bash
git remote add origin https://github.com/<你的用户名>/meta-ad-analysis.git
git push -u origin main
```

## 本地运行

```bash
python3 -m venv .venv
source .venv/bin/activate   # Windows: .venv\Scripts\activate
pip install -r requirements.txt
streamlit run ad_analysis_app.py
```

浏览器打开 `http://localhost:8501`。

## 使用说明

1. 在左侧侧边栏选择大模型服务商并填写 **API Key**（或在 Cloud Secrets 中预填）。
2. 上传 `.xlsx` 或 `.csv` 投放数据文件。
3. 选择报告类型（日报 / 周报 / 月报）与数据范围（单一日期 / 日期范围 / 周末三日）。
4. 点击生成报告，可下载 Word / Markdown / HTML。

## 依赖

见 `requirements.txt`。Excel 解析优先使用 `python-calamine`，兼容 WPS 导出的文件。
