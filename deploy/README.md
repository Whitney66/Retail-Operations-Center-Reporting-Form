部署说明

本目录为用于发布到 GitHub Pages 的静态站点目录，包含 `index.html`。

推荐发布方式（在本地执行）：

1) 使用 gh-pages 分支（会覆盖 gh-pages 内容）：

```bash
cd /path/to/your/local/repo
# 切换或创建 gh-pages 分支
git checkout --orphan gh-pages
git rm -rf .
# 将这里的内容复制到仓库目录根
cp -r "deploy/." ./
# 或在 Windows PowerShell 中：
# Copy-Item -Path 'deploy\*' -Destination '.' -Recurse

git add .
git commit -m "Deploy prototype: add channel filter and table column"
# 强制推送到远程 gh-pages
git push -u origin gh-pages --force
```

2) 使用 main/docs 目录（不覆盖分支）：

```bash
cd /path/to/your/local/repo
mkdir -p docs
cp -r "deploy/." docs/
# PowerShell:
# Copy-Item -Path 'deploy\*' -Destination 'docs' -Recurse

git add docs
git commit -m "Publish prototype to docs/"
git push origin main
```

3) 上传到 Netlify：直接将 `deploy/` 目录打包成 zip，然后在 Netlify 控制台 Drag & Drop 部署。

注意：若页面仍显示旧数据，请在访问页面时在浏览器控制台执行：

```js
localStorage.removeItem('retail_profit_statement_rows_v1');
location.reload();
```

文件位置：
- 已复制到 `deploy/index.html`

若需要，我可以：
- 生成 `deploy.zip`（然后你可以上传到 Netlify）；
- 帮你把其他静态资源也复制进 `deploy/`；
- 生成用于 Windows 的 PowerShell 自动化脚本。
