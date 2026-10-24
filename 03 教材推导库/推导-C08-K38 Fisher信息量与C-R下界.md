---
type: 教材推导
考点码: C08-P02-K38
大类: C08 估计量的评价标准
板块: P02 最小方差无偏估计与 C-R 下界
考点: K38 Fisher 信息量与 C-R 下界
教材: 概率论与数理统计教程
页码转换: 原书页 = PDF 页 − 17（第六章区段已核对页脚）
tags: [推导/C08-P02-K38, 教材/茆诗松]
---

# K38 Fisher 信息量与 C-R 下界

> [!abstract] 一句话结论
> Fisher 信息量 $I(\theta)=E\Big[\big(\frac{\partial\ln p(X;\theta)}{\partial\theta}\big)^2\Big]$ 度量"样本里含多少关于 $\theta$ 的信息"，它有两条等价算法（上面这条 / $-E\big[\frac{\partial^2\ln p}{\partial\theta^2}\big]$）。C-R 不等式说：**任何无偏估计的方差都不可能小于 $\frac{1}{nI(\theta)}$**；方差恰好达到这个下界的叫**有效估计**，它一定也是 UMVUE，反之不然。

## 一、教材原文定位

页码换算：本笔记区段 **原书页 = PDF 页 − 17**（PDF 第 307 页页脚「290」、PDF 第 310 页页脚「293」，逐页核对）。

| 内容 | 双标注页码 |
|---|---|
| §6.4 引入：评价标准要先声明是哪个标准 | PDF 第 303 页（原书 p.286） |
| 6.4.1 均方误差 $\mathrm{MSE}=\mathrm{Var}+\text{偏差}^2$ (6.4.1) | PDF 第 303 页（原书 p.286） |
| 例 6.4.1（有偏估计在 MSE 下可优于无偏估计） | PDF 第 303 页（原书 p.286），续至 PDF 第 304 页（原书 p.287） |
| §6.4.2 一致最小方差无偏估计（UMVUE） | PDF 第 304 页（原书 p.287） |
| 定理 6.4.2（对充分统计量取条件期望可降方差）+ 充分性原则 | PDF 第 307 页（原书 p.290） |
| 例 6.4.3（Rao-Blackwell 化的实例） | PDF 第 307 页（原书 p.290） |
| **定义 6.4.3**（正则条件五条） | PDF 第 307 页（原书 p.290） |
| **Fisher 信息量定义 (6.4.3)** | PDF 第 308 页（原书 p.291） |
| 例 6.4.4（泊松 $I(\lambda)=1/\lambda$）、例 6.4.5（指数 $I(\theta)=1/\theta^2$） | PDF 第 308 页（原书 p.291） |
| **定理 6.4.3 C-R 不等式 (6.4.5)** + 有效估计定义 | PDF 第 308 页（原书 p.291），续至 PDF 第 309 页（原书 p.292） |
| C-R 不等式的证明（柯西—施瓦茨） | PDF 第 309 页（原书 p.292） |
| 例 6.4.6（二点分布 $I=1/(\theta(1-\theta))$，$\bar X$ 达下界）、例 6.4.7（指数） | PDF 第 309 页（原书 p.292） |
| 例 6.4.8（正态 $N(0,\sigma^2)$，$\sigma^2$ 的估计达下界而 $\sigma$ 的达不到） | PDF 第 309 页（原书 p.292），续至 PDF 第 310 页（原书 p.293） |
| 习题 6.4 第 5 题（$I(\theta)=-E\frac{\partial^2\ln p}{\partial\theta^2}$ 的证明） | PDF 第 310 页（原书 p.293） |

> [!warning] OCR 提示
> 例 6.4.4–6.4.8 的 $I(\theta)$ 表达式在 OCR 中多处指数错位（如 $1/\lambda$ 被识成 $\frac{1}{A}$、$1/\theta^2$ 被识成 $\theta^{20}$）。**公式以原书 p.291–293 为准**；本笔记给出的数值均与标准结论一致。

## 二、推导过程

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

## 三、结论与适用条件

**公式汇总**

| 用途 | 公式 |
|---|---|
| 单样本信息量 | $I(\theta)=E\big[(\partial_\theta\ln p)^2\big]=-E\big[\partial^2_\theta\ln p\big]$ |
| $n$ 样本信息量 | $nI(\theta)$（独立样本可加） |
| $g(\theta)$ 无偏估计的 C-R 下界 | $\dfrac{[g'(\theta)]^2}{nI(\theta)}$ |
| $\theta$ 自身无偏估计的下界 | $\dfrac{1}{nI(\theta)}$ |
| MLE 的渐近方差 | $\dfrac{1}{nI(\theta)}$（定理 6.3.1） |

**成立条件（缺一不可）**
1. 定义 6.4.3 的五条正则条件（尤其"支撑与 $\theta$ 无关"）；
2. $T$ 必须是**无偏**估计（有偏估计的方差可以小于下界，不算矛盾）；
3. (6.4.4) 的微商可在积分号下进行。

> **典型违反条件 2 的例子**：均匀总体 $U(0,\theta)$ 中 $\theta$ 的估计，支撑依赖 $\theta$，$I(\theta)$ 根本算不出来，C-R 不等式在这类问题上**不适用**。

## 四、考场用法

**题型 1｜"求 $I(\theta)$"**
两条路选一条：
- $\ln p$ 含 $\ln\theta$、幂次简单 → 直接算一阶导再平方取期望（算法 A）；
- $\ln p$ 是二次型 → 用二阶导取负（算法 B）。
**必须写全**：$\ln p(x;\theta)=\cdots$ → 求导 → 取期望 → 结论。

**题型 2｜"求某无偏估计的 C-R 下界，并判断是否有效"**
三步：算 $I(\theta)$ → 写下界 $\frac{[g'(\theta)]^2}{nI(\theta)}$ → 算 $\mathrm{Var}(T)$ 与之比较。等号即有效（从而 UMVUE），不等号只能说"未达下界"，**不能**说"不是 UMVUE"。

**题型 3｜"$\mathrm{MSE}$ 与 C-R 下界的关系"（概念题）**
$\mathrm{MSE}=\mathrm{Var}+\text{偏差}^2$；C-R 只约束**无偏**估计的方差。所以"某个有偏估计的 MSE 小于 C-R 下界"完全可能、并不矛盾——教材例 6.4.1 就是活例。

**题型 4｜与 MLE 联动**
定理 6.3.1 说 MLE 的渐近方差是 $1/(nI(\theta))$，**正好是 C-R 下界**。这句话是"为什么 MLE 好"的最强答法：**MLE 是渐近有效的**。

**易错点**
- 把 $I(\theta)$ 写成 $nI(\theta)$（样本信息量要乘 $n$，单样本不要）；
- 忘记 $g(\theta)\ne\theta$ 时分子是 $[g'(\theta)]^2$，漏掉导数；
- 在支撑依赖参数的问题上硬套 C-R；
- 把"未达下界"直接判成"不是 UMVUE"。

> [!tip] 串联
> 上游 [[推导-C08-K35 无偏估计与无偏性修正]]（无偏类）+ [[推导-C06-K30 χ²、t、F 分布的构造]]（例 6.4.8 用的 $\chi^2$ 结论）；下游 [[推导-C07-K33 最大似然估计法]]（渐近方差 = $1/(nI)$）。
