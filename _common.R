# _common.R -------------------------------------------------------------------
# Shared set-up sourced at the top of every lesson:
#   source(here::here("_common.R"))
# It only sets *options*; every lesson still loads the packages it uses
# explicitly, so that students can copy a lesson's code and run it on its own.

options(
  digits = 4,
  pillar.sigfig = 4,
  dplyr.summarise.inform = FALSE,
  width = 80
)

# A consistent, readable look for all ggplot2 figures in the course
if (requireNamespace("ggplot2", quietly = TRUE)) {
  ggplot2::theme_set(
    ggplot2::theme_minimal(base_size = 13) +
      ggplot2::theme(
        plot.title.position = "plot",
        plot.title = ggplot2::element_text(face = "bold"),
        panel.grid.minor = ggplot2::element_blank(),
        legend.position = "bottom"
      )
  )
  # Colour-blind friendly palette (Okabe–Ito) as default for discrete scales
  okabe_ito <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442",
                 "#0072B2", "#D55E00", "#CC79A7", "#999999")
  options(
    ggplot2.discrete.colour = okabe_ito,
    ggplot2.discrete.fill   = okabe_ito
  )
}

# Path helper for the course data folder
data_path <- function(...) here::here("data", ...)

# Variable importance helpers -------------------------------------------------
# (The CRAN package 'vip' was archived in December 2025, so the course uses
#  these two small, transparent functions instead.)

# Importance stored by the fitting engine (ranger: impurity or permutation,
# as requested with set_engine("ranger", importance = ...); xgboost: gain),
# drawn as a horizontal bar chart. `fit` is a parsnip model fit, e.g. the
# result of extract_fit_parsnip().
plot_importance <- function(fit, n = 10, title = NULL) {
  eng <- fit$fit
  if (inherits(eng, "ranger")) {
    imp <- eng$variable.importance
    ylab <- paste("Importance (", eng$importance.mode, ")", sep = "")
  } else if (inherits(eng, "xgb.Booster")) {
    tab <- xgboost::xgb.importance(model = eng)
    imp <- stats::setNames(tab$Gain, tab$Feature)
    ylab <- "Importance (gain)"
  } else {
    stop("plot_importance() supports ranger and xgboost fits only.")
  }
  df <- data.frame(variable = names(imp), importance = unname(imp))
  df <- utils::head(df[order(-df$importance), ], n)
  ggplot2::ggplot(df, ggplot2::aes(x = importance,
                                   y = stats::reorder(variable, importance))) +
    ggplot2::geom_col(fill = "#2160B8") +
    ggplot2::labs(x = ylab, y = NULL, title = title)
}

# Model-agnostic permutation importance for a fitted *workflow* and a binary
# outcome: shuffle one predictor at a time, recompute ROC AUC on `data`, and
# record the drop. Returns one row per variable and repetition.
permutation_importance <- function(wf, data, outcome, prob_col,
                                   event_level = "first", nsim = 10) {
  truth <- data[[outcome]]
  auc <- function(d) {
    p <- predict(wf, new_data = d, type = "prob")[[prob_col]]
    yardstick::roc_auc_vec(truth, p, event_level = event_level)
  }
  base_auc <- auc(data)
  vars <- setdiff(names(data), outcome)
  res <- lapply(vars, function(v) {
    drops <- vapply(seq_len(nsim), function(i) {
      d <- data
      d[[v]] <- sample(d[[v]])
      base_auc - auc(d)
    }, numeric(1))
    data.frame(variable = v, sim = seq_len(nsim), importance = drops)
  })
  do.call(rbind, res)
}

# Deep-learning lessons ---------------------------------------------------------
# TRUE when keras3 is installed AND a working Python backend with Keras is
# available. (keras3 has no is_keras_available(); that function belonged to the
# old 'keras' package.) Never errors: returns FALSE if anything is missing.
keras_ready <- function() {
  if (!requireNamespace("keras3", quietly = TRUE) ||
      !requireNamespace("reticulate", quietly = TRUE)) return(FALSE)
  isTRUE(tryCatch(reticulate::py_module_available("keras"),
                  error = function(e) FALSE))
}
