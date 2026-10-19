# Authoring guide for lessons (read fully before writing)

Project root: `/Users/gianlucasottile/Website/An-R-Tutorial-for-Beginners` (bash: `/sessions/keen-gracious-thompson/mnt/Website/An-R-Tutorial-for-Beginners`).

**Reference lesson (copy its structure and tone):** `lessons/08-inference/34-t-tests.qmd`. Read it first.
Old material (source to modernise): `_legacy/R course_lesson N.Rmd`. Known bugs in the old lessons: `_UPGRADE_PLAN.md` §5.2 — every one of them must be fixed in the new version.

## Audience and tone

- Course language: **English**. Readers are university students, often **without a rigorous statistics background**. Write clearly, warmly, concretely. Short paragraphs. Define every technical term the first time it is used.
- Order inside each concept: **why we need it → intuition (plot/simulation/everyday example) → R code → how to read the output → formal details in a collapsible "Going deeper" box**.
- Never claim things you have not verified. Do NOT write numeric results by hand in the prose: use inline R (`` `r round(x, 2)` ``). Numbers inside *solutions* to exercises may be approximate ("about 0.39") but must be checked (see "Verification").
- Avoid hype words ("state-of-the-art", "dominates", "excellent"). No Italian words. No citation artefacts like `[1]`.

## File front matter (exact pattern)

```yaml
---
title: "Short title"
subtitle: "One-line promise of the lesson"
description: "1–2 sentence summary used by search and link previews."
aliases:
  - ../../R-course_lesson-21.html     # ONLY if this lesson replaces an old one (see mapping)
format:                                # only if the interactive exercises need packages; omit otherwise
  live-html:
    webr:
      packages: ["dplyr"]              # must sit under format: live-html in a Quarto project
---
```

If (and only if) the lesson contains `{webr}` cells, the first line after the YAML must be:

```
{{< include ../../_extensions/r-wasm/live/_knitr.qmd >}}
```
(For `lessons/67-capstone.qmd`, which is one level up, use `../_extensions/r-wasm/live/_knitr.qmd`.)

`webr: packages` only *installs* packages in the browser. Attach them with a hidden cell placed right after the include line:

````
```{webr}
#| include: false
#| autorun: true
library(dplyr)
```
````

Then the meta strip (levels: `level-1` "Level 1 · Foundations", `level-2` "Level 2 · Describe & explore", `level-3` "Level 3 · Inference", `level-4` "Level 4 · Models & learning"):

```
::: {.lesson-meta}
[Level 1 · Foundations]{.level-1} [⏱ ~45 min]{} [Prerequisites: [Vectors](04-vectors.qmd)]{}
:::
```

Then:

````
::: {.callout-note .objectives}
## Learning objectives
By the end of this lesson you will be able to:
- ... (3–5 items, operational verbs)
:::

```{r}
#| label: setup
#| include: false
source(here::here("_common.R"))
```

```{r}
#| label: packages
library(dplyr)   # every package the lesson uses, loaded visibly here
```
````

## Body structure

1. `## 1. Why ...?` motivating problem, no formulas.
2. Numbered `##` sections building the concept. Short code chunks (≤ ~15 lines), each followed by explanation.
3. After important outputs, a box:
   ```
   ::: {.callout-tip .read-output}
   ## How to read this output
   ...
   :::
   ```
4. Maths in:
   ```
   ::: {.callout-note .deeper collapse="true"}
   ## Going deeper: <topic>
   ...LaTeX...
   :::
   ```
5. `::: {.callout-warning .pitfall}` `## Common pitfalls` (3–6 numbered items).
6. `## N. Check your understanding` — 2–4 questions, each as
   ```
   ::: {.callout-note collapse="true" icon="false"}
   ## Q1. question text?
   answer
   :::
   ```
7. `## N. Exercises` — see below.
8. `## Summary` — a table of functions/ideas + 3–5 key bullet points.
9. Optional `::: {.callout-note collapse="true" icon="false"}` `## Further reading` with 2–4 reliable free resources (R4DS 2e, IMS 2e, Tidy Modeling with R, ISLR2, package docs). Only well-known real URLs.

Length target: 300–600 lines of .qmd. Lessons replacing an old one must cover at least everything correct in the old lesson.

## Exercises

Each lesson has **4–6 exercises** with difficulty stars `[★]{.stars}`, `[★★]{.stars}`, `[★★★]{.stars}` and mixed types: reproduce · predict the output · debug · interpret an output · mini-analysis. Wrap each in `::: {.exercise}` … `:::`.

**Levels 1–3 (modules 01–08):** at least **2–3 interactive webR exercises** (they run in the browser, R 4.6, packages from the webR repo):

````
::: {.exercise}
[★]{.stars} **Exercise 1 — title.** Instructions.

```{webr}
#| exercise: ex_34_1
res <- t.test(______, mu = ______)
res
```

::: {.hint exercise="ex_34_1"}
hint text
:::

::: {.solution exercise="ex_34_1"}
```r
solution code
```
Explanation.
:::
:::
````

- Exercise ids must be unique: `ex_<lessonnumber>_<n>`.
- `______` (6 underscores) marks blanks.
- Setup code for an exercise: a `{webr}` chunk with `#| setup: true` and `#| exercise: ex_..`.
- Interactive exercises may only use **built-in datasets** (`penguins`, `mtcars`, `iris`, `airquality`, `ToothGrowth`, `sleep`, `chickwts`, `PlantGrowth`, `HairEyeColor`, `faithful`, `cars`, …) or data created in the code — local files in `data/` are NOT available in the browser. Packages must be declared in YAML `webr: packages:` (keep it light: dplyr, tidyr, ggplot2, stringr, forcats, lubridate, purrr, tibble are fine).
- Plus 1–3 "Practice on your own computer" exercises with solutions in `::: {.callout-tip collapse="true"}` `## Solution`.

**Level 4 (modules 09–13):** NO webR cells and NO include line. 4–6 static exercises with collapsible solutions.

## Code style (modern R, 2026)

- R ≥ 4.5. Native pipe `|>`; lambda `\(x)`; tidyverse style guide; `snake_case`; 2-space indent; ≤ 80 chars per line.
- `library()` calls only in the `packages` chunk. For a function used once from a package not loaded: `pkg::fun()`.
- Data files: `readr::read_csv(data_path("file.csv"))` (`data_path()` is defined in `_common.R`). Never `setwd()`. Never absolute paths.
- Randomness: `set.seed()` in the same chunk.
- ggplot2: `linewidth` (not `size`) for lines; `labs()` for every plot; don't add `theme_*()` (the global theme is set in `_common.R`), except when the lesson is teaching themes. Use `#| fig-cap:` and `#| label: fig-...` for important figures.
- Deprecated → modern: `fct_explicit_na()` → `fct_na_value_to_level()`; `fun.y` → `fun`; `gather/spread` → `pivot_longer/wider`; `sample_n` → `slice_sample`; `xgboost` `watchlist` → `evals`; `tree_method="gpu_hist"` → `device="cuda"`; `mutate_at/_if/_all` → `across()`; `summarise(..., .groups = "drop")` or `.by =`.
- Chunks that write files or take very long: `#| eval: false` and explain.
- The main teaching dataset is the base-R **`penguins`** (R ≥ 4.5; columns: `species, island, bill_len, bill_dep, flipper_len, body_mass, sex, year` — NOT the palmerpenguins names). Other datasets live in `data/` (see `data/README.md`).
- Level 4 machine learning uses **tidymodels** (`rsample`, `recipes`, `parsnip`, `workflows`, `tune`, `yardstick`; variable importance via the helpers `plot_importance()` and `permutation_importance()` in `_common.R`, since `vip` was archived from CRAN). Preprocessing is always inside a recipe estimated on the training set (no leakage). Splits: `initial_split(strata = ...)`, `vfold_cv(strata = ...)`, `initial_validation_split()` when a validation set is useful. Engines: `rpart`, `ranger`, `xgboost`, `kernlab`, `glmnet`.

## Verification (mandatory)

There is no Quarto/CRAN in this sandbox, but **base R 4.6 (with `penguins` and all `datasets`) runs via webR**:

```bash
node /tmp/wr/run.mjs /path/to/file.R
```

- Run every chunk that uses only base R / stats / datasets, and every claim you make about the data (direction of effects, approximate values in solutions, which eigenvalues > 1, etc.). Put test scripts in `/tmp/check_<yourname>/`, not in the project.
- For tidyverse/tidymodels code you cannot run: be extremely careful with function names and arguments; prefer well-established APIs; re-read once at the end specifically to hunt for errors.
- If you are unsure a function/argument exists, use a simpler alternative you are sure of.

## Old-URL aliases (old lesson → new file)

L1→01, L2→03, L3→05, L4→06, L5→08, L6→07, L7→09, L8→11, L9→14, L10→15, L11→16, L12→16, L13→17, L14→18, L15→20, L16→19, L17→27, L18→24, L19→25, L20→26, L21→34, L22→37, L23→38, L24→41, L25→56, L26→45, L27→46, L28→47, L29→48, L30→50, L31→51, L32→53, L33→54, L34→54, L35→52, L36→43, L37→57, L38→58, L39→59, L40→60, L41→62, L42→63, L43→64, L44→65, L45→66.
Alias syntax: `- ../../R-course_lesson-<N>.html` (one line per old lesson).

## Full lesson list (for cross-links; link with relative paths, e.g. `../07-probability/30-sampling-distributions.qmd`)

01-foundations: 01-what-is-r, 02-first-steps, 03-data-types, 04-vectors, 05-matrices, 06-factors, 07-lists
02-data: 08-data-frames, 09-dplyr-verbs, 10-grouped-summaries, 11-joins, 12-tidy-reshape, 13-strings-dates
03-programming: 14-functions, 15-conditionals, 16-loops, 17-iteration
04-io: 18-import, 19-export, 20-missing-data
05-descriptive: 21-frequency-tables, 22-summary-statistics, 23-two-variables
06-visualization: 24-ggplot-grammar, 25-distribution-plots, 26-categorical-plots, 27-correlation
07-probability: 28-randomness-simulation, 29-distributions, 30-sampling-distributions, 31-bootstrap
08-inference: 32-confidence-intervals, 33-hypothesis-testing, 34-t-tests, 35-proportions-chisq, 36-nonparametric-tests, 37-anova
09-regression: 38-simple-regression, 39-multiple-regression, 40-model-selection, 41-logistic-regression, 42-poisson-regression, 43-penalized-regression
10-ml: 44-ml-workflow, 45-decision-trees, 46-random-forests, 47-gradient-boosting, 48-svm, 49-model-comparison
11-dimred: 50-pca, 51-factor-analysis, 52-correspondence-analysis, 53-mds, 54-tsne-umap
12-clustering: 55-clustering-intro, 56-kmeans, 57-hierarchical, 58-dbscan, 59-model-based, 60-spectral
13-deep-learning: 61-dl-setup, 62-dnn-tabular, 63-autoencoders, 64-lstm, 65-gru, 66-cnn
lessons/67-capstone.qmd

Images from old lessons are in `images/lessonN-imgK.png` (N = old lesson number). Reuse only if still accurate (flowcharts, diagrams); prefer generating figures with code.

## When you finish

Report back: files written, what each covers, any code you could not verify, and anything you are unsure about. Do not edit `_quarto.yml`, `assets/`, `_common.R` or other agents' files.
