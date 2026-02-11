[![GitHub stars](https://img.shields.io/github/stars/gianluca-sottile/An-R-Tutorial-for-Beginners?style=social)](https://github.com/gianluca-sottile/An-R-Tutorial-for-Beginners)
[![License](https://img.shields.io/github/license/gianluca-sottile/An-R-Tutorial-for-Beginners?color=blue)](LICENSE)
[![GitHub last commit](https://img.shields.io/github/last-commit/gianluca-sottile/An-R-Tutorial-for-Beginners)](https://github.com/gianluca-sottile/An-R-Tutorial-for-Beginners)

# An R Tutorial for Beginners

A complete, beginner‑friendly R course that can support a **9 ECTS / 72‑hour university module**, guiding you from zero to data analysis, visualization, and introductory machine learning in **40+ interactive R Markdown lessons**.

Live website: https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/

---

## 🎯 What you will learn

This course is organized to reflect a full academic syllabus: from core R concepts to supervised and unsupervised learning, with an optional deep learning track based on modern R + Keras.

- **Core R fundamentals**  
  Objects and data types (vectors, matrices, factors, lists, data frames), indexing and subsetting, operators and basic computations.

- **Data preparation & data wrangling**  
  Construction and manipulation of data frames and lists, sorting and merging tables, creation of derived variables, definition of user‑defined functions for reusable preprocessing workflows.

- **R programming basics (imperative & vectorized)**  
  Conditional statements (if/else), loops (for, while, repeat), and their vectorized alternatives via the apply‑family; writing clear, maintainable, and efficient R code.

- **Data I/O & data management**  
  Import and export of data in different formats (CSV, text, Excel, SPSS, etc.), handling missing values, basic data cleaning and preparation for analysis.

- **Exploratory data analysis & visualization**  
  Descriptive statistics, correlation and association, scatter plots, boxplots, bar charts and histograms, basic statistical tests (t‑test, one‑way and two‑way ANOVA) with graphical summaries.

- **Machine learning foundations (supervised & unsupervised)**  
  - Supervised learning: simple and multiple linear regression, stepwise procedures, generalized linear models, penalized regression (ridge/lasso), decision trees, random forests, gradient boosting, and support vector machines.  
  - Unsupervised learning: k‑means, hierarchical clustering, DBSCAN, model‑based clustering (Gaussian mixtures), and spectral clustering; plus core dimensionality reduction techniques.

- **Deep learning (optional track, keras3 + TensorFlow in R)**  
  Deep neural networks for tabular data, autoencoders for representation learning, sequence modeling with LSTM/GRU, and CNNs for image classification.

Throughout the course, the focus is on **reproducible analysis in R**, good programming practice, and critical interpretation of results in a data science workflow.

---

## 🧠 Learning outcomes

By working through the lessons, you will be able to:

- Use R and RStudio as your main environment for data manipulation, statistical analysis, visualization, and reproducible reporting.
- Create, transform, and combine R objects (vectors, matrices, factors, lists, data frames) to build analysis‑ready datasets.
- Write and debug your own R functions, use control flow and vectorized patterns, and structure robust analysis pipelines.
- Import and export data from common file formats, handle missing values, and perform principled data cleaning.
- Conduct exploratory data analysis, compute descriptive measures, and produce informative tables and plots.
- Fit and interpret core supervised learning models in R, checking model assumptions and evaluating predictive performance.
- Apply unsupervised learning methods such as k‑means, hierarchical, density‑based, and model‑based clustering, as well as dimensionality reduction techniques, to explore structure in multivariate data.
- Build, train, and validate deep learning models in R with keras3 and TensorFlow, using regularization, early stopping, and principled train/validation/test evaluation.

---

## 📋 Lesson index

Below is the current lesson structure, aligned with the main pillars of the course.

### Fundamentals

| # | Lesson | Source (.Rmd) | Rendered (HTML) |
|---|--------|---------------|-----------------|
| 1 | What is R? | [Rmd](R%20course_lesson%201.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-1.html) |
| 2 | Data Types | [Rmd](R%20course_lesson%202.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-2.html) |
| 3 | Matrix | [Rmd](R%20course_lesson%203.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-3.html) |
| 4 | Factors | [Rmd](R%20course_lesson%204.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-4.html) |

### Data preparation & data structures

| # | Lesson | Source (.Rmd) | Rendered (HTML) |
|---|--------|---------------|-----------------|
| 5 | Data Frames | [Rmd](R%20course_lesson%205.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-5.html) |
| 6 | Lists | [Rmd](R%20course_lesson%206.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-6.html) |
| 7 | Sort a Data Frame | [Rmd](R%20course_lesson%207.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-7.html) |
| 8 | Merge Data Frames | [Rmd](R%20course_lesson%208.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-8.html) |
| 9 | Functions | [Rmd](R%20course_lesson%209.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-9.html) |

### R programming (control flow & vectorization)

| # | Lesson | Source (.Rmd) | Rendered (HTML) |
|---|--------|---------------|-----------------|
| 10 | IF, ELSE, and ELSE IF Statements | [Rmd](R%20course_lesson%2010.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-10.html) |
| 11 | For Loops | [Rmd](R%20course_lesson%2011.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-11.html) |
| 12 | While Loop | [Rmd](R%20course_lesson%2012.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-12.html) |
| 13 | apply(), lapply(), sapply(), tapply() | [Rmd](R%20course_lesson%2013.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-13.html) |
| 14 | Import Data | [Rmd](R%20course_lesson%2014.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-14.html) |
| 15 | How to Replace Missing Values | [Rmd](R%20course_lesson%2015.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-15.html) |
| 16 | Exporting Data | [Rmd](R%20course_lesson%2016.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-16.html) |

### Exploratory data analysis & basic inference

| # | Lesson | Source (.Rmd) | Rendered (HTML) |
|---|--------|---------------|-----------------|
| 17 | Correlation | [Rmd](R%20course_lesson%2017.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-17.html) |
| 18 | Scatter Plot | [Rmd](R%20course_lesson%2018.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-18.html) |
| 19 | How to Make a Boxplot | [Rmd](R%20course_lesson%2019.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-19.html) |
| 20 | Bar Chart & Histogram | [Rmd](R%20course_lesson%2020.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-20.html) |
| 21 | T Test | [Rmd](R%20course_lesson%2021.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-21.html) |
| 22 | ANOVA: One-way & Two-way | [Rmd](R%20course_lesson%2022.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-22.html) |

### Machine learning – supervised learning

| # | Lesson | Source (.Rmd) | Rendered (HTML) |
|---|--------|---------------|-----------------|
| 23 | Simple, Multiple Linear and Stepwise Regression | [Rmd](R%20course_lesson%2023.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-23.html) |
| 24 | Generalized Linear Model (Logistic Regression) | [Rmd](R%20course_lesson%2024.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-24.html) |
| 25 | Ridge & Lasso Regression (Penalized Linear Models) | [Rmd](R%20course_lesson%2036.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-36.html) |
| 26 | Decision Trees | [Rmd](R%20course_lesson%2026.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-26.html) |
| 27 | Random Forest | [Rmd](R%20course_lesson%2027.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-27.html) |
| 28 | Gradient Boosting | [Rmd](R%20course_lesson%2028.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-28.html) |
| 29 | Support Vector Machines | [Rmd](R%20course_lesson%2029.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-29.html) |

### Machine learning – dimensionality reduction

| # | Lesson | Source (.Rmd) | Rendered (HTML) |
|---|--------|---------------|-----------------|
| 30 | Principal Component Analysis (PCA) | [Rmd](R%20course_lesson%2030.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-30.html) |
| 31 | Factor Analysis (FA) | [Rmd](R%20course_lesson%2031.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-31.html) |
| 32 | Multidimensional Scaling (MDS) | [Rmd](R%20course_lesson%2032.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-32.html) |
| 33 | t-Distributed Stochastic Neighbor Embedding (t-SNE) | [Rmd](R%20course_lesson%2033.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-33.html) |
| 34 | Uniform Manifold Approximation and Projection (UMAP) | [Rmd](R%20course_lesson%2034.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-34.html) |
| 35 | Correspondence Analysis (CA) | [Rmd](R%20course_lesson%2035.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-35.html) |

### Machine learning – unsupervised learning & advanced models

| # | Lesson | Source (.Rmd) | Rendered (HTML) |
|---|--------|---------------|-----------------|
| 36 | K-means Clustering | [Rmd](R%20course_lesson%2025.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-25.html) |
| 37 | Hierarchical Clustering (Dendrograms & Linkage) | [Rmd](R%20course_lesson%2037.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-37.html) |
| 38 | Density-based Clustering (DBSCAN) | [Rmd](R%20course_lesson%2038.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-38.html) |
| 39 | Model-based Clustering (Gaussian Mixtures) | [Rmd](R%20course_lesson%2039.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-39.html) |
| 40 | Spectral Clustering | [Rmd](R%20course_lesson%2040.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-40.html) |

### Deep learning (keras3 + TensorFlow)

| # | Lesson | Source (.Rmd) | Rendered (HTML) |
|---|--------|---------------|-----------------|
| 41 | Deep Neural Networks (Tabular Data) | [Rmd](R%20course_lesson%2041.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-41.html) |
| 42 | Autoencoders (Representation Learning & Anomaly Analysis) | [Rmd](R%20course_lesson%2042.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-42.html) |
| 43 | LSTM for Electricity Demand Forecasting | [Rmd](R%20course_lesson%2043.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-43.html) |
| 44 | Text Classification (Fast GRU / Global Pooling) | [Rmd](R%20course_lesson%2044.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-44.html) |
| 45 | CNN for Image Classification (Fast Fashion-MNIST) | [Rmd](R%20course_lesson%2045.Rmd) | [HTML](https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/R-course_lesson-45.html) |

---

## 🔧 Quick start

```r
# Option 1: clone with usethis (RStudio)
usethis::create_from_github("gianluca-sottile/An-R-Tutorial-for-Beginners")
```

```bash
# Option 2: classic git
git clone https://github.com/gianluca-sottile/An-R-Tutorial-for-Beginners.git
cd An-R-Tutorial-for-Beginners
```

Open `An-R-Tutorial-for-Beginners.Rproj` in RStudio, then knit `index.Rmd` (or build the site). This will render the full set of lessons as a browsable website.

### Prerequisites

- R ≥ 4.3 – https://posit.co/download/r  
- RStudio – https://posit.co/download/rstudio-desktop/  

A basic background in descriptive and inferential statistics is recommended (random variables, distributions, confidence intervals, hypothesis tests).

### Deep learning prerequisites (optional)

The deep learning lessons are based on `keras3` and `tensorflow` for R. If you want to execute the training code locally, make sure your Keras/TensorFlow backend is properly configured in your environment.

---

## 🤝 Contribute

1. 🍴 **Fork** the repository  
2. 🔀 Create a branch `feature/your-feature`  
3. 💾 Commit + push  
4. 📤 Open a pull request

[![Issues](https://img.shields.io/github/issues/gianluca-sottile/An-R-Tutorial-for-Beginners)](https://github.com/gianluca-sottile/An-R-Tutorial-for-Beginners/issues)

---

## 📚 Extra resources

If you want to go beyond the material covered here, consider exploring:

- Official R documentation and style guides.
- Tidyverse workflows for data manipulation and visualization.
- Additional references on supervised/unsupervised learning and deep learning in R.

---

**👨‍💻 Author**: [Gianluca Sottile](https://github.com/gianluca-sottile)  
**📄 License**: [CC-BY-SA-4.0](LICENSE)
