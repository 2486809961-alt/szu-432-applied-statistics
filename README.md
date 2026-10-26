# 深圳大学 432 应用统计 · 四级 Obsidian 题库

把 2019–2026 共 8 年真题拆成 **152 道单题复盘**，四级落位：**大类 › 章节 › 知识点与考点 › 题目解析与复盘**。知识点页承载课本内容（文字 + 页码），不嵌 PDF 页图。

> 纯 Obsidian 库，克隆后用 Obsidian 打开仓库根目录即可。

## 零、一键接入（从 GitHub 直接进 Obsidian）

`scripts/obsidian-connect.sh`＝**搜到一个 Obsidian 仓库 → 本机直接打开**：clone/更新 → 装 **OpenPlug**（免 VPN 装社区插件）+ 指定插件 → 写 `.obsidian` 配置并启用 → `obsidian://` 打开。

```bash
# 接入本仓库（已 clone 时）
bash scripts/obsidian-connect.sh 2486809961-alt/szu-432-applied-statistics 432应用统计 openplug,copilot

# 没有 clone？curl 一行
curl -fsSL https://raw.githubusercontent.com/2486809961-alt/szu-432-applied-statistics/main/scripts/obsidian-connect.sh \
  | bash -s 2486809961-alt/szu-432-applied-statistics 432应用统计 openplug,copilot

# 任意仓库 + 任意插件
bash scripts/obsidian-connect.sh <owner/repo> [库名] [插件,逗号分隔]
```

插件表（内置映射）：`openplug` · `copilot` · `templater-obsidian` · `dataview` · `obsidian-style-settings` · `obsidian-paste-image-rename` · `obsidian-mindmap-nextgen` · `obsidian-excalidraw-plugin` · `easy-typing-obsidian` · `floating-toc` · `mousewheel-image-zoom` · `oz-clear-unused-images` · `obsidian-git` · `callout-manager` · `editing-toolbar` · `realclaudian`。
细节见 [[99 模板与规范/接入-Obsidian一键安装|接入-Obsidian一键安装]]。仓库**不收录插件本体**（`.gitignore` 已排除 `.obsidian/plugins/`），克隆只有几 MB。

## 一、四级目录

```
C01 随机事件与概率/                 L1 大类（18）
  第01章 事件与概率的基本概念/       L2 章节（43）
    K01 样本空间、事件的关系与运算/   L3 知识点与考点（73）
      K01 样本空间、事件的关系与运算.md   课本原文定位 + 推导要点 + 考法 + 题目清单
      2021-选择-01 ....md              L4 题目解析与复盘（152）
```

| 层 | 内容 | 数量 |
|---|---|---|
| L1 | 大类 C01–C18 | 18 |
| L2 | 章节 | 43 |
| L3 | 知识点与考点 | 73 |
| L4 | 单题解析与复盘 | **152** |
| 旁挂 | 教材推导库 | 59 |
| 旁挂 | 试卷层 | 17 |
| 资产 | 题目裁图 | 444 |

题量分布：2019 年 13、2020 年 30、2021 年 21、2022 年 10、2023 年 6、2024 年 23、2025 年 31、2026 年 18。

## 二、L3 知识点与考点页长什么样

1. 一句话考点
2. 一、课本内容：1.1 教材原文定位表｜1.2 推导与要点（纯文字）
3. 二、考法与真题分布 ｜ 三、易错点 ｜ 四、复盘三问
4. 五、题目清单（该考点全部真题）

## 三、L4 单题页（七段）

一、原题 · 二、考点定位 · 三、解题思路 · 四、完整解答 · 五、易错点 · 六、同类真题 · 七、我的复盘，页尾附「本题涉及的知识点」。

## 四、页码口径

PDF ≤316 时 原书 = PDF − 17；PDF ≥321 时 原书 = PDF − 21；317–320 为误扫《贝叶斯统计》，禁引。统计部分课本内容待补，不编页码。
