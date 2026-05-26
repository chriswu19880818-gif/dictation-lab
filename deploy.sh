#!/bin/bash
# 更新听写训练网站 — 同时推到 GitHub + Netlify
# 用法: 改完 index.html 后，在 WSL 终端跑: bash ./deploy.sh
set -e
export PATH="$HOME/.hermes/node/bin:$PATH"
cd /mnt/c/Users/Chirs/Desktop/dictation-lab

echo "📦 推送到 GitHub..."
git add .
git commit -m "更新: $(date '+%Y-%m-%d %H:%M')" || echo "（无变更）"
git push

echo "🚀 部署到 Netlify..."
netlify deploy --prod --dir=.

echo ""
echo "✅ 更新完成！"
echo "   Netlify:     https://capable-cocada-0d6d1d.netlify.app/"
echo "   GitHub Pages: https://chriswu19880818-gif.github.io/dictation-lab/"
