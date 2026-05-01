# First-Run & Upgrade Setup

## IMPORTANT: If upgrading from a previous version

You MUST delete stale auto-generated `.Rd` files before re-documenting.
The old files are cached on disk and `devtools::check()` reads them instead
of the freshly generated ones.

Run this in R with the package root as your working directory:

```r
# Step 1: Delete stale .Rd files
source("inst/cleanup_stale_rd.R")

# Step 2: Regenerate documentation
devtools::document()

# Step 3: Install
devtools::install()

# Step 4: Test
devtools::test()

# Step 5: Full check (optional)
devtools::check()
```

Or from the terminal (shell):
```bash
rm man/*.Rd
```

## Fresh install (no prior version)

```r
devtools::document()
devtools::install()
devtools::test()
```

## Quick start after install

```r
library(NonlinearDiD)

dat <- sim_binary_panel(n = 500, nperiods = 8, seed = 42)
res <- nonlinear_attgt(dat, "y", "period", "id", "g", outcome_model = "logit")
plot(nonlinear_aggte(res, type = "dynamic"))
nonlinear_pretest(res)
```

## Troubleshooting

| Error | Fix |
|-------|-----|
| `sim_count_panel.Rd: unexpected section header` | Run `source("inst/cleanup_stale_rd.R")` then `devtools::document()` |
| `could not find function "vcovHC"` | Run `devtools::document()` then `devtools::install()` |
| `could not find function "ggplot"` | Run `devtools::document()` then `devtools::install()` |
| Link warnings for function names in docs | Cosmetic only after fresh `document()` — safe to ignore |
| Rcpp compilation errors | Ensure Rtools 4.5 (Windows) or Xcode CLI (macOS) is installed |
