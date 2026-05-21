<#
Usage: 在仓库根目录运行此脚本（确保有 push 权限）
PowerShell 示例：
  Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
  .\deploy\push_to_repo.ps1

此脚本会把 `deploy/` 与 workflow 一并添加到当前仓库并推送到 `main`。
#>

Write-Host "准备将 deploy/ 与 workflow 提交并推送到远程仓库 (main) ..."

git add deploy .github/workflows/deploy.yml
try {
  git commit -m "Add deploy content and GitHub Actions workflow for gh-pages auto-deploy"
} catch {
  Write-Host "提交失败（可能没有改动），继续推送..." -ForegroundColor Yellow
}

git push origin main

Write-Host "已执行 push（请在 GitHub 上检查 Action 运行情况）" -ForegroundColor Green
