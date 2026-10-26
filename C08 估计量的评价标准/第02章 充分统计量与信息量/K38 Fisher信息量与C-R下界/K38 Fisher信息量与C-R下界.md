---
type: 知识点与考点
考点码: C08-P02-K38
大类: C08 估计量的评价标准
章节: 第02章 充分统计量与信息量
知识点: K38 Fisher信息量与C-R下界
考频: 1
年份: [2023]
tags: [知识点/C08-P02-K38, 大类/C08]
---

# K38 Fisher信息量与C-R下界

> [!abstract] 一句话考点
> I(θ)=E[(∂ln f/∂θ)²]=−E[∂²ln f/∂θ²]；iid 时 I_n(θ)=nI(θ)；C-R 不等式 D(θ̂)≥1/(nI(θ))。

> [!info] 四级定位
> L1 [[C08 估计量的评价标准]] › L2 [[第02章 充分统计量与信息量]] › **L3 知识点与考点（本页）** › L4 题目复盘

## 一、课本内容

### 1.1 教材原文定位

| # | 具体知识点 | 教材位置 | 页码 |
|---|---|---|---|
| 1 | §6.4 引入：评价标准要先声明是哪个标准 | — | PDF 第 303 页（原书 p.286） |
| 2 | 6.4.1 均方误差 $\mathrm{MSE}=\mathrm{Var}+\text{偏差}^2$ (6.4.1) | — | PDF 第 303 页（原书 p.286） |
| 3 | 例 6.4.1（有偏估计在 MSE 下可优于无偏估计） | — | PDF 第 303 页（原书 p.286），续至 PDF 第 304 页（原书 p.287） |
| 4 | §6.4.2 一致最小方差无偏估计（UMVUE） | — | PDF 第 304 页（原书 p.287） |
| 5 | 定理 6.4.2（对充分统计量取条件期望可降方差）+ 充分性原则 | — | PDF 第 307 页（原书 p.290） |
| 6 | 例 6.4.3（Rao-Blackwell 化的实例） | — | PDF 第 307 页（原书 p.290） |
| 7 | **定义 6.4.3**（正则条件五条） | — | PDF 第 307 页（原书 p.290） |
| 8 | **Fisher 信息量定义 (6.4.3)** | — | PDF 第 308 页（原书 p.291） |
| 9 | 例 6.4.4（泊松 $I(\lambda)=1/\lambda$）、例 6.4.5（指数 $I(\theta)=1/\theta^2$） | — | PDF 第 308 页（原书 p.291） |
| 10 | **定理 6.4.3 C-R 不等式 (6.4.5)** + 有效估计定义 | — | PDF 第 308 页（原书 p.291），续至 PDF 第 309 页（原书 p.292） |
| 11 | C-R 不等式的证明（柯西—施瓦茨） | — | PDF 第 309 页（原书 p.292） |
| 12 | 例 6.4.6（二点分布 $I=1/(\theta(1-\theta))$，$\bar X$ 达下界）、例 6.4.7（指数） | — | PDF 第 309 页（原书 p.292） |
| 13 | 例 6.4.8（正态 $N(0,\sigma^2)$，$\sigma^2$ 的估计达下界而 $\sigma$ 的达不到） | — | PDF 第 309 页（原书 p.292），续至 PDF 第 310 页（原书 p.293） |
| 14 | 习题 6.4 第 5 题（$I(\theta)=-E\frac{\partial^2\ln p}{\partial\theta^2}$ 的证明） | — | PDF 第 310 页（原书 p.293） |

### 1.2 推导与要点（文字）

### 1. 为什么要它：MSE 与 UMVUE 的链条

$$\mathrm{MSE}(\hat\theta)=E(\hat\theta-\theta)^2=\mathrm{Var}(\hat\theta)+\big(E(\hat\theta)-\theta\big)^2 . \tag{6.4.1}$$

无偏时第二项为 0，$\mathrm{MSE}=\mathrm{Var}$——**所以"无偏类里比方差"就是"比 MSE"**，这才是 UMVUE 概念的由来。教材 p.287 还指出：若不加限制（在所有估计里找"一致最小 MSE"），这样的估计**不存在**（因为对任一 $\theta_0$，取常值估计 $\hat\theta\equiv\theta_0$ 在该点的 MSE 为 0），所以必须加合理性约束，无偏性就是最常用的那个。

### 2. Fisher 信息量的定义与两条算法

**定义 6.4.3（原书 p.290）的五条正则条件**：
1. 参数空间 $\Theta$ 是直线上的开区间；
2. 支撑 $S=\{x:p(x;\theta)>0\}$ **与 $\theta$ 无关**；
3. 导数 $\frac{\partial}{\partial\theta}p(x;\theta)$ 对一切 $\theta$ 存在；
4. 积分与微分可交换次序；
5. $E\big[\frac{\partial}{\partial\theta}\ln p(X;\theta)\big]$ 存在。

满足后定义

$$I(\theta)=E\Big[\Big(\frac{\partial}{\partial\theta}\ln p(X;\theta)\Big)^2\Big]. \tag{6.4.3}$$

**算法 A（定义式，用平方的期望）**：
先算得分函数 $\dfrac{\partial\ln p}{\partial\theta}$，再求其平方的期望。

**算法 B（二阶导式，考试更快）**：

$$I(\theta)=-E\Big[\frac{\partial^2}{\partial\theta^2}\ln p(X;\theta)\Big].$$

（这条在习题 6.4 第 5 题要求证明，原书 p.293。推导只需对 $\int p\,\mathrm dx=1$ 求两次导，利用可交换次序。）

> **实用建议**：$\ln p$ 是二次型（正态）时用算法 B，一步出结果；$\ln p$ 含有 $\ln\theta$ 项时算法 A、B 差不多。两条结果必须一致，可作为自查。

### 3. 三个必背的 $I(\theta)$（教材例 6.4.4–6.4.6）

| 总体 | $\ln p$ 中的关键项 | $I(\theta)$ |
|---|---|---|
| $P(\lambda)$ | $x\ln\lambda-\lambda$ | $\dfrac{1}{\lambda}$ |
| $Exp(1/\theta)$（均值 $\theta$） | $-\ln\theta-x/\theta$ | $\dfrac{1}{\theta^2}$ |
| $B(1,p)$ | $x\ln p+(1-x)\ln(1-p)$ | $\dfrac{1}{p(1-p)}$ |
| $N(0,\sigma^2)$（对 $\sigma^2$ 求） | $-\frac12\ln\sigma^2-\frac{x^2}{2\sigma^2}$ | $\dfrac{1}{2\sigma^4}$ |

**以泊松为例走一遍（算法 A）**：$\ln p(x;\lambda)=x\ln\lambda-\lambda-\ln(x!)$，故 $\dfrac{\partial\ln p}{\partial\lambda}=\dfrac{x}{\lambda}-1$，

$$I(\lambda)=E\Big[\Big(\frac{X}{\lambda}-1\Big)^2\Big]=\frac{E(X^2)-2\lambda E(X)+\lambda^2}{\lambda^2}=\frac{(\lambda+\lambda^2)-2\lambda^2+\lambda^2}{\lambda^2}=\frac{1}{\lambda}.$$

（用到 $E(X)=\mathrm{Var}(X)=\lambda$，故 $E(X^2)=\lambda+\lambda^2$。）

**指数分布用算法 B**：$\ln p=-\ln\theta-\dfrac{x}{\theta}$，$\dfrac{\partial^2\ln p}{\partial\theta^2}=\dfrac{1}{\theta^2}-\dfrac{2x}{\theta^3}$，取期望（$E X=\theta$）得 $\dfrac{1}{\theta^2}-\dfrac{2}{\theta^2}=-\dfrac{1}{\theta^2}$，取负号即 $I(\theta)=1/\theta^2$。

> **$I(\theta)$ 越大 = 该分布里关于 $\theta$ 的信息越多**（教材 p.291 原话）。直观：分布的"形状"对 $\theta$ 越敏感，$\ln p$ 的斜率波动越大。

### 4. C-R 不等式：完整的证明骨架（定理 6.4.3）

**设定**：$p(x;\theta)$ 满足定义 6.4.3；$x_1,\dots,x_n$ 是样本；$T=T(x_1,\dots,x_n)$ 是 $g(\theta)$ 的**任一**无偏估计，$g'(\theta)$ 存在，且

$$g(\theta)=\int\cdots\int T(x_1,\dots,x_n)\,p(x_1;\theta)\cdots p(x_n;\theta)\,\mathrm dx_1\cdots\mathrm dx_n \tag{6.4.4}$$

的微商可在积分号下进行。则

$$\mathrm{Var}(T)\ \ge\ \frac{[g'(\theta)]^2}{n\,I(\theta)}. \tag{6.4.5}$$

**证明（原书 p.292，共四步）**：

**第 1 步**：由 $\int p(x;\theta)\,\mathrm dx=1$ 两边对 $\theta$ 求导（可交换次序）：

$$0=\int\frac{\partial p}{\partial\theta}\,\mathrm dx=\int\frac{\partial\ln p}{\partial\theta}\,p\,\mathrm dx=E\Big[\frac{\partial\ln p}{\partial\theta}\Big],$$

即**得分函数期望为 0**。

**第 2 步**：记 $Z=\sum_{i=1}^n\dfrac{\partial\ln p(x_i;\theta)}{\partial\theta}$（整样本的得分）。由第 1 步 $E(Z)=0$，所以

$$\mathrm{Var}(Z)=E(Z^2)=\sum_{i=1}^nE\Big[\Big(\frac{\partial\ln p}{\partial\theta}\Big)^2\Big]=nI(\theta)$$

（交叉项因样本独立而消失）。

**第 3 步**：对 (6.4.4) 求导：

$$g'(\theta)=\int T\cdot Z\cdot\prod p(x_i;\theta)\,\mathrm dx=E(TZ)=E\big[(T-g(\theta))Z\big]$$

（末一步用了 $E(Z)=0$ 与 $E(T)=g(\theta)$）。

**第 4 步**：柯西—施瓦茨不等式：

$$[g'(\theta)]^2=\big(E[(T-g(\theta))Z]\big)^2\le E\big[(T-g(\theta))^2\big]\cdot E(Z^2)=\mathrm{Var}(T)\cdot nI(\theta).$$

移项即 (6.4.5)。$\blacksquare$

**特例（最常用）**：$g(\theta)=\theta$ 时 $g'=1$，

$$\mathrm{Var}(\hat\theta)\ \ge\ \frac{1}{nI(\theta)} .$$

### 5. 有效估计：等号成立的条件

(6.4.5) 取等号的充要条件是柯西—施瓦茨取等号，即 $T-g(\theta)$ 与 $Z$ 成比例：

$$\sum_{i=1}^n\frac{\partial\ln p(x_i;\theta)}{\partial\theta}=c(\theta)\big(T-g(\theta)\big).$$

满足者称 $T$ 是 $g(\theta)$ 的**有效估计**。教材明确指出：**有效估计一定是 UMVUE**（原书 p.292）。

**例 6.4.6（二点分布）**：$I(\theta)=1/(\theta(1-\theta))$，$nI$ 的倒数为 $\theta(1-\theta)/n$；而 $\bar X$ 无偏且 $\mathrm{Var}(\bar X)=\theta(1-\theta)/n$ **恰好等于下界** ⇒ $\bar X$ 是有效估计，也是 UMVUE。

**例 6.4.7（指数）**：$I=1/\theta^2$，下界 $\theta^2/n$；$\bar X$ 无偏且方差 $=\theta^2/n$ ⇒ 有效。

**例 6.4.8（正态 $N(0,\sigma^2)$，这是"达不到下界"的标本）**：

- $I(\sigma^2)=\dfrac{1}{2\sigma^4}$，故 $\sigma^2$ 的无偏估计的 C-R 下界是 $\dfrac{2\sigma^4}{n}$；而 $\dfrac1n\sum X_i^2$ 无偏且方差恰为 $\dfrac{2\sigma^4}{n}$ ⇒ 达下界，是 UMVUE。
- 换成 $\sigma$：$g(\sigma^2)=\sqrt{\sigma^2}$，$g'=\dfrac{1}{2\sigma}$，故 $\sigma$ 的 C-R 下界为 $\dfrac{[1/(2\sigma)]^2}{n/(2\sigma^4)}=\dfrac{\sigma^2}{2n}$。而 $\sigma$ 的无偏估计（修偏系数那一个）**方差大于** $\dfrac{\sigma^2}{2n}$ ⇒ **所有 $\sigma$ 的无偏估计都达不到 C-R 下界**。

> 教材在例 6.4.8 末尾下的结论是"能达到 C-R 下界的无偏估计并不多"——这句是简答题的采分点。

### 6. C-R 下界与 UMVUE 的逻辑关系（易混，务必分清）

$$\text{有效估计}\ \subset\ \text{UMVUE}\ \subset\ \text{无偏估计}$$

- 达下界 ⇒ 是 UMVUE（因为方差已是最小可能）；
- 是 UMVUE ⇒ **不一定**达下界（例 6.4.8 的 $\sigma$ 估计）；
- 反过来，**C-R 下界算不出来 ≠ UMVUE 不存在**（可能只是 $p$ 不满足正则条件，例如支撑依赖参数的 $U(0,\theta)$）。

## 二、考法与真题分布

**考频 1 题**（2023）

| 年份 | 题型 | 题号 | 题干摘要 | 答案 | 题目 |
|---|---|---|---|---|---|
| 2023 | 简答 | 3 | 费希尔信息量的定义 | — | [[2023-简答-03 Fisher信息量与C-R下界]] |

## 三、易错点 / 我的笔记

- [ ]

## 四、复盘三问

- [ ] 错在哪一步（概念 / 公式 / 计算 / 读题）
- [ ] 同一考法还能怎么变形
- [ ] 下次遇到先做什么（第一步动作）

## 五、题目清单（L4）

- [[2023-简答-03 Fisher信息量与C-R下界]]
