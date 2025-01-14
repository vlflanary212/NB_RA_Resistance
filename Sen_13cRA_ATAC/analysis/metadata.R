# Generate a metadata data frame for the 13cRA ATAC-seq data

# Load packages
library(tidyverse)
library(here)

# Load data
counts <- read_csv(
  here("Sen_13cRA_ATAC", "data", "counts", "distal_regions_raw_counts.csv")
)

# Set variables
sample <- setdiff(colnames(counts), "fragments")
cell_line <- rep(c("IMR-5", "SHEP-1", "SK-N-AS", "SH-SY5Y"), each = 2)
replicate <- rep(c(1, 2), 4)
age_months <- rep(c(13, 48, 72, 48), each = 2)
sex <- c(rep("Male", 2), rep("Female", 6))
mycn_status <- c(rep("MYCN_Amp", 2), rep("MYCN_NonAmp", 6))
phenotype <- c(rep("ADR", 2), rep("MES", 4), rep("ADR", 2))

# Generate the dataframe
metadata <- data.frame(
  cell_line, replicate, age_months, sex, mycn_status, phenotype,
  row.names = sample
)

# Check the dataframe
View(metadata)

# Save the metadata as coldata
write.table(
  metadata,
  here("Sen_13cRA_ATAC", "data", "coldata.txt"),
  row.names = TRUE,
  col.names = TRUE,
  quote = FALSE
)
