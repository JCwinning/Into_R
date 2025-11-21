[English](README.md) | [中文](_README_CN.md)


# R 编程手册

使用 Quarto 构建的 R 编程语言综合指南。本项目涵盖从基础 R 概念到高级数据处理、可视化和发布技术的所有内容。



## 🌐 在线网站

访问手册：[https://jcwinning.github.io/Into_Python/](https://jcwinning.github.io/Into_R/)


## 📚 概述

本手册旨在成为 R 编程的学习资源和实用参考，适用于各个水平的学习者。无论您是刚开始学习 R，还是希望扩展在数据分析、可视化或 Web 应用开发方面的技能，都能在这里找到相关内容。

## 🚀 快速开始

### 环境要求

- [R](https://www.r-project.org/) (推荐 R 4.0+)
- [Quarto](https://quarto.org/) 用于渲染文档
- [Python 3.13](https://www.python.org/) (用于 reticulate 集成)
- R 包：使用 `install.packages(c("tidyverse", "quarto", "reticulate", "shiny"))` 安装

### 安装步骤

1. 克隆此仓库：
   ```bash
   git clone https://github.com/yourusername/Into_R.git
   cd Into_R
   ```

2. 安装所需的 R 包：
   ```r
   install.packages(c("tidyverse", "quarto", "reticulate", "shiny", "plotly", "leaflet"))
   ```

3. 渲染项目：
   ```bash
   quarto render
   ```

## 📖 内容结构

### 🎯 R 入门
- **基础 R**: 基本概念、文件操作、错误处理、函数、循环、使用 `renv` 进行版本控制
- **概率论**: 随机数、排列组合、概率分布、正态性检验
- **统计学**: 变量类型、集中趋势和离散程度度量、协方差、相关性
- **错误处理**: 常见问题故障排除、Python 集成问题

### 🔧 数据处理
- **I/O 操作**: 各种格式的读写数据 (CSV, Excel, Parquet, SQLite)
- **数据结构**: 理解向量、列表、数据框等
- **Tidyverse**: 全面覆盖 `dplyr`、`tidyr`、`stringr`、`lubridate`
- **data.table**: 高性能数据处理
- **Recipes**: 建模数据预处理
- **重采样**: 训练/测试集创建
- **SQL 数据库**: 从 R 进行数据库集成
- **数据管理**: 最佳实践和组织

### 📊 可视化与绘图
- **ggplot2**: 从基础到高级的静态可视化
- **plotly**: 交互式基于 Web 的图表
- **图像处理**: 基础图像操作和分析
- **金融数据**: 时间序列可视化技术
- **地图绘制**: 使用 `leaflet` 和 `mapview` 的空间可视化
- **图表俱乐部**: 高级绘图技术和示例

### 🚀 发布与部署
- **Shiny**: 交互式 Web 应用程序和游戏
- **Quarto**: 动态文档、演示文稿、网站
- **仪表板**: 数据仪表板设计和实现
- **电子邮件**: 从 R 发送自动邮件报告
- **Git**: 版本控制和协作工作流

### 🛠️ 附加工具
- **Google Analytics**: 网络分析集成
- **网络爬虫**: 使用 `rvest` 和 `chromote` 进行数据提取
- **API**: 使用 Web API
- **翻译**: 文本处理和翻译工具

## 🏗️ 项目架构

```
Into_R/
├── intro/                 # R 基础和概念
├── data manipulation/     # 数据处理和预处理
├── Plot/                  # 可视化和绘图
│   └── Map/              # 空间可视化
├── Publish/               # 输出格式和部署
│   ├── Shiny/            # 交互式应用程序
│   ├── quarto/           # Quarto 文档和网站
│   └── ...
├── other/                 # 附加工具和技术
├── docs/                  # 渲染的 HTML 输出
├── _freeze/               # 缓存的计算结果
└── index.qmd             # 项目概述
```



### Python 集成

使用 Python 代码块的文档需要 reticulate 设置：


```{r setup-python, include=FALSE}
library(reticulate)
use_python("/Library/Frameworks/Python.framework/Versions/3.13/bin/python3")
```
