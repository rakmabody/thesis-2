# Project title

> **Template instructions:** replace everything in _italics_, then delete this box.

_One or two sentences: what question is this project doing?_

## Data

Data and analysis outputs are **not** stored in this repository (see `.gitignore`).

| Dataset | Where it comes from | Where to put it |
| --- | --- | --- |
| _e.g., measurements.csv_ | _e.g., downloaded by `scripts/01_download_data.R` / EPA AQS, accessed 2026-10-01 / shared drive path_ | `data/raw/` |

## How to reproduce the results

Open `project.Rproj` in RStudio, then run everything in order:

```r
source("run_all.R")
```

| Script | Reads | Writes |
| --- | --- | --- |
| `scripts/01_download_data.R` | _source_ | `data/raw/` |
| `scripts/02_clean_data.R` | `data/raw/` | `data/clean/` |
| `scripts/03_analysis.R` | `data/clean/` | `output/` |
| `scripts/04_figures_tables.R` | `data/clean/`, `output/` | `figures/` |

## Folder structure

```
scripts/      all code, numbered in run order; folder paths are set in scripts/paths.R
data/raw/     original inputs, never edited by hand (not in git)
data/clean/   analysis-ready data made by scripts (not in git)
output/       analysis results, especially slow-to-re-run ones (not in git)
figures/      figures and tables for the manuscript
manuscript/   writing and presentations
scratch/      things you're testing that might not be used
```

## Software

_e.g., R 4.4; packages: tidyverse, sf, ..._
