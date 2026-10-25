% KLayout 使用手册 · 中文版
% ---------------------------------------------------------------------------
%  本文件为工程说明与维护规程（不是 LaTeX 源文件，不影响编译）
%
%  原著：Matthias Köfferlein，GNU General Public License v3
%  底稿：https://github.com/KLayout/klayout  src/doc/doc/manual/
%        commit 7eb9a25（2026-10-18），与 KLayout 0.30.12 同版
% ---------------------------------------------------------------------------

1. 目录结构
   main.tex              编译入口（XeLaTeX，编两遍以更新目录与交叉引用）
   klayout-manual.sty    样式：字体、颜色、样式框、图、代码
   chapters/             按部拆分的章节（自动回填生成）
   figures/              原文配图，84 张，文件名与上游一致
   build/                LaTeX 中间产物与 main.pdf
   LICENSE-klayout.txt   上游许可原文（GPLv3），未改动
   COPYRIGHT-klayout.txt 上游版权声明原文，未改动

2. 编译
   xelatex -output-directory=build main.tex
   xelatex -output-directory=build main.tex
   字体使用 TeX Live 自带的 Fandol（FandolSong / FandolHei / FandolKai / FandolFang），
   换机器不需要装系统字体。

3. 翻译约定
   · 术语一律保留英文原词：Layer View、Layer Set、Cell、Instance、PCell、Flatten、
     Partial Mode、Shape、Path、Box、DRC、LVS 等不译；首次出现时以
     “Cell（单元）”形式括注中文，之后只用英文原词。
   · 菜单项、按钮、对话框、命令、快捷键、参数、图层名一律保留英文。
   · 代码与脚本不译，注释也保留原文。
   · 叙述文字译成中文。
   · 原文中少量非术语的技术内容（如 LVS 篇的 circuit/net 概念）为可读性仍作中文说明；
     如需严格统一为“全部保留英文”，只需改 work/translations 中对应条目。

4. 行内标记（只允许这几种，build.py 会转义其余字符）
   \ui{...}      界面元素 / 菜单项 / 按钮，等宽显示
   \menu{...}    菜单路径，如 View > Navigator
   \kbd{...}     快捷键
   \ref{sec:...} 交叉引用，目标为篇目名

5. 样式框
   klNote  提示 / 注意（合并为一类，默认标题“提示”）
   klUI    界面元素说明，框内保留英文原文
   klCmd   命令 / 脚本示例

6. 维护流程（译文不要直接改 chapters/*.tex）
   译文与结构都在工具工程的 work/ 下：
     sources/manual/*.xml     上游原文（抓取所得）
     work/units/<page>.json   每篇的结构
     work/translations/*.json 译文
     work/extract.py          抽取 Structure
     work/batch.py            切分翻译批次
     work/build.py            回填生成 chapters/*.tex
   改译文 → 跑 build.py → 拷 chapters/*.tex 回本工程 → 编译。

7. 尚未落地的部分
   · 批次 b01–b27（KLayout Basics）之外的部尚未翻译；chapters/ 下缺失的部会显示空章。
   · 表格（drc/lvs 篇目的参数表）目前按单栏表格粗略回填，需要人工细化。
   · 原文的交叉链接 <link href="...">…</link> 已回填为粗体文字（\textbf），后续可替换为 \ref。
