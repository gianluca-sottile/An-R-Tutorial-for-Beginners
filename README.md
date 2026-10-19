[![Publish site](https://github.com/gianluca-sottile/An-R-Tutorial-for-Beginners/actions/workflows/publish.yml/badge.svg)](https://github.com/gianluca-sottile/An-R-Tutorial-for-Beginners/actions/workflows/publish.yml)
[![License: CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/gianluca-sottile/An-R-Tutorial-for-Beginners?style=social)](https://github.com/gianluca-sottile/An-R-Tutorial-for-Beginners)

# From Data to Models with R

*A beginner's course in statistics and machine learning*

**A free, open course that takes you from your first line of R to statistical modelling and machine learning — written for students without a strong statistics background.**

🌐 **Website:** <https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/>

- **67 lessons** in four levels: R foundations → describe & explore → uncertainty & inference → models & learning (+ optional deep learning and a capstone project)
- **340+ exercises** with hints and solutions, **130+ of them runnable in the browser** (webR) — nothing to install
- Intuition first: every statistical idea starts from a concrete problem, a plot or a simulation; formulas live in collapsible "Going deeper" boxes
- Modern, reproducible R: native pipe, tidyverse, **tidymodels**, Quarto, project-based workflows
- Can support a university module of up to **9 ECTS / 72 hours**
- 🇮🇹 **Italian version** of the whole course (except the optional deep-learning track): <https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/it/>

## Course structure

| Level | Modules |
|---|---|
| 1 · R foundations | Getting started · Working with data · Programming · Data in and out |
| 2 · Describe & explore | Descriptive statistics · Visualisation |
| 3 · Uncertainty & inference | Probability & simulation · Statistical inference |
| 4 · Models & learning | Regression models · Supervised learning · Dimensionality reduction · Clustering |
| Optional | Deep learning with keras3 · Capstone project |

See the [learning path](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/learning-path.html) for the full list.

## For students

1. Install R (≥ 4.5) from <https://cran.r-project.org> and RStudio or Positron.
2. Install all course packages:
   ```r
   source("https://raw.githubusercontent.com/gianluca-sottile/An-R-Tutorial-for-Beginners/master/scripts/install-packages.R")
   ```
3. Start from [Start here](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/setup.html).

## For instructors and contributors

The site is a [Quarto](https://quarto.org) website.

Once after cloning: install the interactive-exercise extension (commit `_extensions/`) and the packages; then preview while editing and render the full site into `_site/`.

```bash
quarto add r-wasm/quarto-live
Rscript scripts/install-packages.R
quarto preview
quarto render
```

**Computations are frozen.** `execute: freeze: auto` stores every result in `_freeze/`; commit it with your `.qmd` changes. The GitHub Action (`.github/workflows/publish.yml`) then builds the site *without running R*, so heavy lessons (e.g. deep learning) only ever run on your machine. Deep-learning lessons use `freeze: true` and are re-run only when you delete their folder in `_freeze/`.

Repository layout:

```
_quarto.yml           site configuration, navigation
index.qmd, setup.qmd, learning-path.qmd, glossary.qmd, about.qmd
lessons/              67 lessons, one folder per module
assets/               theme (SCSS) and custom CSS
_common.R             options and ggplot theme shared by all lessons
data/                 datasets used in lessons (see data/README.md)
images/               figures and logo
scripts/              install-packages.R
_legacy/              the previous R Markdown version (not rendered)
_dev/                 authoring guide for lessons (not rendered)
```

Old lesson URLs (`R-course_lesson-N.html`) redirect automatically to the new pages.

## License

Content is licensed under [CC BY-SA 4.0](LICENSE). © Gianluca Sottile, University of Palermo.
