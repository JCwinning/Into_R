[English](README.md) | [中文](_README_CN.md)


# Into R: A Comprehensive R Programming Handbook

A comprehensive R programming reference and educational guide built with Quarto, covering everything from fundamental concepts to advanced data science techniques.

## 🌐 Live Website

Visit the handbook at: [https://jcwinning.github.io/Into_Python/](https://jcwinning.github.io/Into_R/)


## Overview

This project serves as both learning material and practical reference for R programming, featuring:

- **Core R programming concepts** (syntax, data structures, control flow)
- **Data manipulation** techniques with tidyverse, data.table, and SQL
- **Data visualization** using ggplot2, plotly, and specialized charting libraries
- **Web development** with Shiny apps and interactive dashboards
- **Publishing workflows** with Quarto documents and Git integration
- **Advanced topics** including web scraping, API integration, and data pipelines

## Project Structure

```
Into_R/
├── intro/                    # Core R concepts
│   ├── basic_r.qmd          # R fundamentals and syntax
│   ├── probability.qmd      # Probability and statistics
│   └── error_handling.qmd   # Debugging and error management
├── data manipulation/        # Data wrangling
│   ├── tidyverse.qmd        # dplyr, tidyr, and friends
│   ├── data.table.qmd       # High-performance data tables
│   ├── SQL.qmd              # Database integration
│   └── recipes.qmd          # Data preprocessing
├── Plot/                    # Visualization
│   ├── ggplot2.qmd          # Grammar of graphics
│   ├── plotly.qmd           # Interactive plots
│   ├── image_process.qmd    # Image manipulation
│   ├── finance_chart.qmd    # Financial visualizations
│   └── mapping.qmd          # Geographic data
├── Publish/                 # Output and deployment
│   ├── shiny.qmd            # Interactive web apps
│   ├── quarto.qmd           # Document publishing
│   ├── dashboard.qmd        # Business dashboards
│   └── Git.qmd              # Version control
└── other/                   # Additional tools
    ├── Google_Analytics.qmd # Web analytics
    ├── web_scraping.qmd     # Data extraction
    └── API.qmd              # API integration
```

## Features

- **Quarto-powered documentation** with interactive HTML output
- **Code examples** throughout with syntax highlighting and folding
- **Python integration** via reticulate for cross-language workflows
- **Responsive design** with table of contents and navigation
- **Practical examples** from real-world data science scenarios

## Getting Started

### Prerequisites

- R (version 4.0+ recommended)
- Quarto document system
- Python 3.13 (for cross-language examples)

### Installation

1. Clone this repository:
```bash
git clone <repository-url>
cd Into_R
```

2. Install required R packages:
```r
# Core packages
install.packages(c("tidyverse", "quarto", "reticulate", "shiny"))

# Additional packages per section (see individual documents)
```

3. Install Quarto:
```bash
# Visit https://quarto.org/docs/get-started/
```



### Python Setup

For documents that include Python code chunks, ensure reticulate is configured:


```{r setup-python, include=FALSE}
library(reticulate)
use_python("/Library/Frameworks/Python.framework/Versions/3.13/bin/python3")
```


