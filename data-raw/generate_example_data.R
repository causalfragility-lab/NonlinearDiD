## Script to generate example datasets bundled with the package
## Run with: source("data-raw/generate_example_data.R")

library(NonlinearDiD)

# ---- Binary example data ----
set.seed(2024)
nonlineardid_binary_example <- sim_binary_panel(
  n             = 1000,
  nperiods      = 8,
  prop_treated  = 0.5,
  n_cohorts     = 3,
  true_att      = c(0.15, 0.25, 0.20),
  base_prob     = 0.30,
  unit_fe_sd    = 0.5,
  add_covariates = TRUE
)

attr(nonlineardid_binary_example, "description") <-
  "Simulated binary panel data with 3 treatment cohorts and staggered adoption.
   N = 1000 units, T = 8 periods. True ATTs: 0.15, 0.25, 0.20 (probability scale).
   DGP: logistic with unit FEs and two covariates (x1 continuous, x2 binary)."

# ---- Count example data ----
set.seed(2025)
nonlineardid_count_example <- sim_count_panel(
  n             = 800,
  nperiods      = 6,
  prop_treated  = 0.5,
  n_cohorts     = 3,
  true_rr       = c(1.3, 1.8, 1.5),
  base_rate     = 8,
  overdispersion = FALSE
)

attr(nonlineardid_count_example, "description") <-
  "Simulated Poisson count panel data with 3 treatment cohorts.
   N = 800 units, T = 6 periods. True rate ratios: 1.3, 1.8, 1.5.
   DGP: Poisson with multiplicative unit and time effects."

# Save
usethis::use_data(nonlineardid_binary_example, overwrite = TRUE)
usethis::use_data(nonlineardid_count_example,  overwrite = TRUE)

message("Example datasets saved to data/")
