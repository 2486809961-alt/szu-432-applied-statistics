#!/usr/bin/env bash
# obsidian-connect — 把 GitHub 上的 Obsidian 仓库一条命令接入本机 Obsidian
#
# 用法:
#   obsidian-connect <github-url|owner/repo> [vault名] [插件,逗号分隔]
# 例:
#   obsidian-connect 2486809961-alt/szu-432-applied-statistics 432应用统计 openplug,copilot
#   obsidian-connect RoxyRhHg/Lazy-Kaoyan-Library 考研数一 openplug,templater-obsidian,dataview
#
# 做四件事: 1) clone/pull 到 ~/Documents/<vault名>  2) 装 openplug(+指定插件)
#           3) 写入 .obsidian 配置并启用  4) 用 obsidian:// 打开
set -euo pipefail

ARG="${1:-}"; VAULT="${2:-}"; PLUGS="${3:-}"
[ -z "$ARG" ] && { sed -n '2,12p' "${BASH_SOURCE[0]:-}" 2>/dev/null || true; exit 1; }
case "$ARG" in
  http*|git@*) URL="$ARG"; SLUG="$(basename "${ARG%.git}" | sed 's/^.*://')";;
  */*)         URL="https://github.com/$ARG.git"; SLUG="${ARG##*/}";;
  *)           echo "✗ 无法识别: $ARG"; exit 1;;
esac
[ -z "$VAULT" ] && VAULT="${SLUG%.git}"
DEST="${OBSIDIAN_CONNECT_DIR:-$HOME/Documents}/$VAULT"

echo "▸ 仓库  $URL"
echo "▸ 库名  $VAULT"
echo "▸ 路径  $DEST"

# 1) clone / pull
if [ -d "$DEST/.git" ]; then
  echo "▸ 已存在 → git pull --ff-only"
  git -C "$DEST" pull --ff-only || echo "  ! pull 失败（有本地改动？），继续用现有文件"
else
  mkdir -p "$(dirname "$DEST")"
  git clone --depth 1 "$URL" "$DEST"
fi

# 2) 插件：openplug 必装，其余按参数
PLUGDIR="$DEST/.obsidian/plugins"; mkdir -p "$PLUGDIR"
repo_of() {
  case "$1" in
    openplug) echo jiaoyingxing/openplug;;
    copilot) echo logancyang/obsidian-copilot;;
    templater-obsidian) echo silentvoid13/Templater;;
    dataview) echo blacksmithgu/obsidian-dataview;;
    obsidian-style-settings) echo obsidian-community/obsidian-style-settings;;
    obsidian-paste-image-rename) echo reorx/obsidian-paste-image-rename;;
    obsidian-mindmap-nextgen) echo james-tindal/obsidian-mindmap-nextgen;;
    obsidian-excalidraw-plugin) echo zsviczian/obsidian-excalidraw-plugin;;
    easy-typing-obsidian) echo yaozhuwa/easy-typing-obsidian;;
    floating-toc) echo pkm-er/obsidian-floating-toc-plugin;;
    mousewheel-image-zoom) echo nicojeske/mousewheel-image-zoom;;
    oz-clear-unused-images) echo ozntel/oz-clear-unused-images-obsidian;;
    obsidian-git) echo vinzent03/obsidian-git;;
    callout-manager) echo eth-p/obsidian-callout-manager;;
    editing-toolbar) echo pkm-er/obsidian-editing-toolbar;;
    realclaudian) echo yishentu/claudian;;
    *) echo "";;
  esac
}
LIST="openplug${PLUGS:+,$PLUGS}"
IFS=',' read -ra ARR <<< "$LIST"
for id in "${ARR[@]}"; do
  id="$(echo "$id" | tr -d ' ')"; [ -z "$id" ] && continue
  repo="$(repo_of "$id")"
  if [ -z "$repo" ]; then
    echo "  ? 未知插件 $id（用内置表补: 复制 obsidian-connect.sh 的 REPO 映射）"; continue
  fi
  mkdir -p "$PLUGDIR/$id"
  ok=0
  for f in main.js manifest.json styles.css; do
    if curl -fsSL -m 120 "https://github.com/$repo/releases/latest/download/$f" \
         -o "$PLUGDIR/$id/$f" 2>/dev/null; then ok=$((ok+1)); else rm -f "$PLUGDIR/$id/$f"; fi
  done
  echo "  ✔ $id ($repo) 文件 $ok/3"
done

# 3) 启用插件 + 关闭受限模式
python3 - "$DEST" "$LIST" <<'PY'
import json, os, sys
dest, lst = sys.argv[1], sys.argv[2]
od = os.path.join(dest, ".obsidian"); os.makedirs(od, exist_ok=True)
cpj = os.path.join(od, "community-plugins.json")
cur = []
if os.path.exists(cpj):
    try: cur = json.load(open(cpj))
    except Exception: cur = []
ids = [x.strip() for x in lst.split(",") if x.strip()]
new = cur + [i for i in ids if i not in cur and os.path.exists(os.path.join(od, "plugins", i, "main.js"))]
json.dump(new, open(cpj, "w"), ensure_ascii=False, indent=2)
app = os.path.join(od, "app.json")
cfg = {}
if os.path.exists(app):
    try: cfg = json.load(open(app))
    except Exception: cfg = {}
cfg["safeMode"] = False
json.dump(cfg, open(app, "w"), ensure_ascii=False, indent=2)
print(f"  启用插件 {len(new)} 个: {', '.join(new)}")
PY

# 4) 打开
Q=$(python3 -c "import urllib.parse,sys;print(urllib.parse.quote(sys.argv[1]))" "$VAULT")
case "$(uname)" in
  Darwin) command -v open >/dev/null && open "obsidian://open?vault=$Q" && echo "▸ 已请求 Obsidian 打开「$VAULT」";;
  Linux)  command -v xdg-open >/dev/null && xdg-open "obsidian://open?vault=$Q" || true;;
esac
echo "✔ 接入完成：$DEST（首次打开若提示受限模式，点“启用社区插件”即可）"
