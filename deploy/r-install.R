#
# Helper script to install R dependencies
#

# load latest version of BiocManager
if ("BiocManager" %in% rownames(installed.packages()))
	remove.packages("BiocManager")

install.packages("devtools", repos="https://cran.rstudio.com")
devtools::install_github("Bioconductor/BiocManager")

library(BiocManager)

if (BiocManager::version() != "3.7")
  BiocManager::install(version="3.7", update=TRUE, ask=FALSE)

# create a combined list of all R package dependencies
pkgs <- as.vector(unlist(sapply(Sys.glob('r-*.txt'), readLines)))

# install R dependencies
BiocManager::install(pkgs, update=FALSE, ask=FALSE)
