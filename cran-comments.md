## Resubmission

Addressing review from Uwe Ligges:

1. Fixed invalid GitHub URLs -- changed from placeholder
   yourusername/NonlinearDiD to correct repository
   causalfragility-lab/NonlinearDiD

2. Added doi references to Description field:
   Callaway & Sant Anna (2021) <doi:10.1016/j.jeconom.2020.12.001>,
   Roth & Sant Anna (2023) <doi:10.3982/ECTA19255>,
   Wooldridge (2023) <doi:10.1093/ectj/utad016>

3. Wrapped slow examples in \donttest{} to resolve
   example timing error in R CMD check

## R CMD check results

0 errors | 0 warnings | 0 notes

## Test environments

* Windows 11 x64, R 4.5.1 (local)
* Windows (win-builder), R-devel
* Ubuntu (GitHub Actions), R-release
* macOS (GitHub Actions), R-release

## Downstream dependencies

None -- this is a new package.
