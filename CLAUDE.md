# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a comprehensive R programming handbook built with Quarto, serving as both educational material and practical reference. The project covers R fundamentals, data manipulation, visualization, and publishing techniques.

## Project Structure

The project is organized into thematic sections:

- **intro/**: Core R programming concepts (basic R, probability, statistics, error handling)
- **data manipulation/**: Data wrangling techniques (tidyverse, data.table, SQL, recipes)
- **Plot/**: Visualization topics (ggplot2, plotly, image processing, financial charts, mapping)
- **Publish/**: Output formats and deployment (Shiny apps, Quarto documents, dashboards, Git)
- **other/**: Additional tools and techniques (Google Analytics, web scraping, APIs)

## Key Development Commands

### Quarto Rendering
```bash
# Render individual files
quarto render "path/to/file.qmd"

# Render entire project
quarto render

# Render with cache refresh
quarto render --cache-refresh

# Check Quarto installation
quarto check
```

### Python Environment Setup
This project uses reticulate for R-Python integration. Python must be configured in documents that use Python code chunks:

```r
```{r setup-python, include=FALSE}
library(reticulate)
use_python("/Library/Frameworks/Python.framework/Versions/3.13/bin/python3")
```
```

### Common File Patterns
- Each `.qmd` file follows consistent YAML header structure with `execute: warning: false, error: false`
- HTML output format with TOC, code folding, and custom styling
- Python setup chunks are required in files with Python code
- Images and data files are typically stored in subdirectories within each section

## Document Architecture

### YAML Header Template
```yaml
---
title: "Document Title"
author: "Tony Duan"
execute:
  warning: false
  error: false
format:
  html:
    toc: true
    toc-location: right
    code-fold: show
    code-tools: true
    number-sections: true
    code-block-bg: true
    code-block-border-left: "#31BAE9"
---
```

### Code Execution Setup
Documents requiring Python integration must include the setup chunk before any Python code. R code chunks can be written using standard `{r}` syntax or cross-language syntax with double curly braces `{{r}}`.

### Content Organization
- Sections use `#` for main titles and follow logical progression
- Code examples are integrated with explanations
- Tabbed content uses `::: panel-tabset` syntax
- Custom CSS files (like `hscroll.css`) can be referenced in YAML headers

## Technical Dependencies

- **R**: Core programming environment
- **Quarto**: Document generation system
- **Python 3.13**: For Python integration via reticulate
- **tidyverse**: Data manipulation ecosystem
- **Shiny**: Interactive web applications
- **Various visualization packages**: ggplot2, plotly, leaflet, etc.

## Output Structure

Rendered HTML files are generated in `docs/` directory, maintaining the same folder structure as source files. The project serves as both development environment and published documentation website.