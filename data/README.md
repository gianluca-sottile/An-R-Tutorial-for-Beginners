# Course datasets

Read them in a lesson with `readr::read_csv(data_path("<file>"))` (`data_path()` is defined in `_common.R`).
Many lessons use datasets that ship with R instead (`penguins`, `mtcars`, `iris`, `airquality`, `sleep`, `ToothGrowth`, `HairEyeColor`, `eurodist`, …).

| File | Rows × cols (approx.) | Content | Used in |
|---|---|---|---|
| `mtcars.csv` | 32 × 12 | Copy of `mtcars` with the car name as first column — used to practise importing a CSV | Import |
| `binary.sas7bdat`, `binary.dta`, `binary.sav` | small | The same small example dataset stored in SAS, Stata and SPSS formats | Import |
| `prison.csv` | 714 × 46 | US state panel on prison population and crime, 1980–1993 (first column `x` is a row index) | Lists / Import |
| `test.csv` | 418 × 11 | Titanic passengers (Kaggle "test" split) with missing `Age`, `Fare`, `Cabin` | Missing data |
| `titanic_data.csv` | 1309 × 13 | Full Titanic passenger list (`pclass, survived, name, sex, age, sibsp, parch, ticket, fare, cabin, embarked, home.dest`); missing values coded as `"?"` in some columns | Trees, ML workflow |
| `british_household.csv` | 1519 × 11 | UK household budget shares (`wfood, wfuel, wcloth, walc, wtrans, wother`), `totexp`, `income`, `age`, `children` (first column is a row index) | Correlation |
| `poisons.csv` | 48 × 3 | Survival `time` of animals by `poison` (3 types) and `treat` (4 treatments) — classic balanced two-way design (Box & Cox, 1964) | ANOVA |
| `women.csv` | 15 × 2 | Copy of `women` (height, weight) | — (use built-in `women`) |
| `adult.csv` | 48 842 × 10 | US Census "Adult" data: `age, workclass, education, educational-num, marital-status, race, gender, hours-per-week, income` (`<=50K`/`>50K`); first column `x` is a row index | Logistic regression |
| `computers.csv` | 6259 × 11 | Prices and specifications of personal computers, 1993–1995 (`price, speed, hd, ram, screen, cd, multi, premium, ads, trend`) | k-means |
| `wholesale_customers.csv` | 440 × 8 | Annual spending of wholesale clients on six product categories plus `Channel` and `Region` (UCI) | Clustering |
| `bank_marketing.csv`, `adult_data.csv`, `lahman-batting.csv`, `train.csv`, `travel_times.csv` | — | Not used by the current lessons; kept for exercises and projects | Capstone ideas |
