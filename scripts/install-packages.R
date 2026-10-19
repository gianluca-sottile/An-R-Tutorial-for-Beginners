# install-packages.R ----------------------------------------------------------
# Installs every package used in "From Data to Models with R".
# Run once:  source("scripts/install-packages.R")
# Requires R >= 4.5 (the course uses the built-in `penguins` data).

if (getRversion() < "4.5.0") {
  warning("This course assumes R >= 4.5.0 (for the built-in `penguins` data). ",
          "Please update R from https://cran.r-project.org")
}

# Rscript runs non-interactively and may have no CRAN mirror set: use the
# global cloud mirror unless the user has chosen one.
repos <- getOption("repos")
if (is.null(repos) || is.na(repos["CRAN"]) || repos["CRAN"] == "@CRAN@") {
  options(repos = c(CRAN = "https://cloud.r-project.org"))
}

core <- c(
  # project infrastructure
  "here", "rmarkdown", "knitr", "ragg", "renv",
  # data import / export / wrangling
  "tidyverse", "janitor", "readxl", "haven", "openxlsx", "writexl", "arrow",
  # descriptive statistics, plots, inference
  "GGally", "patchwork", "ggridges", "Hmisc", "naniar", "mice", "boot",
  # regression
  "broom", "car", "lmtest", "sandwich", "marginaleffects", "MASS", "pscl",
  # machine learning (tidymodels)
  "tidymodels", "glmnet", "rpart", "rpart.plot", "ranger", "xgboost",
  "kernlab", "finetune", "class", "embed",
  # multivariate & clustering
  "psych", "psychTools", "GPArotation", "ca", "FactoMineR", "cluster", "mclust", "dbscan",
  "Rtsne", "uwot"
)

# Optional deep-learning track (lesson 61 explains the extra set-up)
deep_learning <- c("keras3", "reticulate", "tsibbledata", "Matrix")

install_if_missing <- function(pkgs) {
  missing <- setdiff(pkgs, rownames(installed.packages()))
  if (length(missing) > 0) {
    message("Installing: ", paste(missing, collapse = ", "))
    install.packages(missing)
  } else {
    message("All packages already installed.")
  }
}

install_if_missing(core)

if (interactive() &&
    isTRUE(utils::askYesNo("Install the optional deep-learning packages too?",
                           default = FALSE))) {
  install_if_missing(deep_learning)
  message("Now run keras3::install_keras() once (see lesson 61).")
}
