# NonlinearDiD Makefile
# Convenience targets for package development

.PHONY: document build check test install clean vignettes

# Generate documentation with roxygen2
document:
	Rscript -e "devtools::document()"

# Build the package tarball
build:
	Rscript -e "devtools::build()"

# Full R CMD check
check:
	Rscript -e "devtools::check()"

# Run tests only
test:
	Rscript -e "devtools::test()"

# Install the package locally
install:
	Rscript -e "devtools::install()"

# Build vignettes
vignettes:
	Rscript -e "devtools::build_vignettes()"

# Load package interactively (for development)
load:
	Rscript -e "devtools::load_all()"

# Run pkgdown site locally
site:
	Rscript -e "pkgdown::build_site()"

# Coverage report
coverage:
	Rscript -e "covr::report()"

# Clean build artifacts
clean:
	rm -f *.tar.gz
	rm -rf NonlinearDiD.Rcheck/
	rm -rf docs/

# Quick dev cycle: document + test
dev: document test
