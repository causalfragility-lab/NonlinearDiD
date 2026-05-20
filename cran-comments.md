## Submission — version 0.2.0

This is an update to NonlinearDiD, currently on CRAN at version 0.1.0.

### Summary of changes since 0.1.0

* Added support for **repeated cross-section** staggered DiD designs via a
  new `data_type` argument in `nonlinear_attgt()`. The default
  `data_type = "panel"` preserves all v0.1.0 behaviour.
* `idname` is now optional (default `NULL`); required only for
  `data_type = "panel"`.
* New `weightsname` argument applies sampling weights throughout the
  outcome regression, propensity score model, and pooled QMLE.
* New `cluster_var` argument enables clustered inference:
  `sandwich::vcovCL()` for analytical SEs and cluster resampling for the
  bootstrap.
* New exported function `sim_binary_rcs()` for simulating repeated
  cross-section data.
* Compiled C++ helpers from v0.1.0 replaced with equivalent pure-R
  implementations. The package no longer requires compilation
  (`NeedsCompilation: no`).

### Backward compatibility

All v0.1.0 panel-data functions and their named-argument syntax are
preserved unchanged. Existing user scripts that call
`nonlinear_attgt()` with named arguments
(`idname = "id"`, `gname = "g"`, ...) continue to work identically.
A regression test (`tests/testthat/test-attgt.R`) covers the documented
v0.1.0 panel example and the `binary_did_dr()` 2x2 example.

### R CMD check results

`R CMD check --as-cran` on Windows 11 (R 4.5.1) reports:

    0 errors | 0 warnings | 1 note

The single NOTE is:

    checking for future file timestamps ... NOTE
      unable to verify current time

This is an environmental note unrelated to the package (the check could
not reach the NIST time server from the test machine) and is routinely
ignored by CRAN.

### Test environments

* local: Windows 11, R 4.5.1
* `devtools::test()`: 16 / 16 tests pass

### Reverse dependencies

None.
