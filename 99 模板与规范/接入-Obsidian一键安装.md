---
type: 规范
title: "[[接入-Obsidian一键安装]]"
tags: [432, 规范, 接入]
---

# 从 GitHub 一条命令接入 Obsidian

`scripts/obsidian-connect.sh` 把「搜到一个 GitHub Obsidian 仓库 → 本机直接打开」压成一条命令：clone/更新 → 装 **OpenPlug** 与指定插件 → 写 `.obsidian` 配置并启用 → 用 `obsidian://` 打开。

## 一、接入本仓库

```bash
# 已 clone 过：直接跑脚本
bash scripts/obsidian-connect.sh 2486809961-alt/szu-432-applied-statistics 432应用统计 openplug,copilot

# 没 clone 过：先拿脚本再跑（curl 一行）
curl -fsSL https://raw.githubusercontent.com/2486809961-alt/szu-432-applied-statistics/main/scripts/obsidian-connect.sh \
  | bash -s 2486809961-alt/szu-432-applied-statistics 432应用统计 openplug,copilot
```

## 二、接入任意仓库

```bash
bash scripts/obsidian-connect.sh <github-url|owner/repo> [库名] [插件,逗号分隔]

# 例：把 Lazy-Kaoyan-Library 接进来并装它的全部依赖
bash scripts/obsidian-connect.sh RoxyRhHg/Lazy-Kaoyan-Library 考研数一 \
  openplug,templater-obsidian,dataview,obsidian-style-settings,obsidian-paste-image-rename,\
obsidian-mindmap-nextgen,obsidian-excalidraw-plugin,easy-typing-obsidian,floating-toc,\
mousewheel-image-zoom,oz-clear-unused-images,obsidian-git,callout-manager,editing-toolbar,realclaudian
```

## 三、脚本做的四件事

| # | 动作 | 细节 |
|---|---|---|
| 1 | 取仓库 | 已有 `.git` → `git pull --ff-only`；否则 `git clone --depth 1` 到 `~/Documents/<库名>` |
| 2 | 装插件 | 从各插件 GitHub Release 拉 `main.js / manifest.json / styles.css`；**OpenPlug 必装** |
| 3 | 写配置 | 追加 `.obsidian/community-plugins.json`，并把 `app.json` 的 `safeMode` 设为 `false` |
| 4 | 打开 | macOS `open "obsidian://open?vault=<库名>"`（Linux 走 `xdg-open`） |

## 四、插件表（内置映射，含本库常用全集）

`openplug`(OpenPlug) · `copilot`(Obsidian Copilot) · `templater-obsidian` · `dataview` · `obsidian-style-settings` · `obsidian-paste-image-rename` · `obsidian-mindmap-nextgen` · `obsidian-excalidraw-plugin` · `easy-typing-obsidian` · `floating-toc` · `mousewheel-image-zoom` · `oz-clear-unused-images` · `obsidian-git` · `callout-manager` · `editing-toolbar` · `realclaudian`

## 五、OpenPlug 在里面干什么

OpenPlug 接管官网「Add to Obsidian」跳转，**不用 VPN** 就能在 Obsidian 内搜索、选版本、校验安装社区插件与主题。装好它之后，本库缺的其它插件可以直接在 Obsidian 里点装，不必再回终端。

## 六、说明

- 仓库**不收录插件本体**（`.gitignore` 已排除 `.obsidian/plugins/`），克隆只有几 MB；插件由本脚本或 OpenPlug 现场安装。
- 首次打开若提示「受限模式」，点一次「启用社区插件」即可（脚本已预置 `safeMode: false`）。
- 环境变量 `OBSIDIAN_CONNECT_DIR` 可改落地目录（默认 `~/Documents`）。
