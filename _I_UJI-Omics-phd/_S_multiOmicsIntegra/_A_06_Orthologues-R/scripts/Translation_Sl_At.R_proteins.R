# Translate from tomato to arabidopsis:

# Install packages:

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install()

install.packages("devtools")


# Install package dependencies

BiocManager::install(c("Biostrings", "GenomicRanges", "GenomicFeatures", "Rsamtools", "rtracklayer"))

BiocManager::install("remotes")

BiocManager::install(c("vitkl/orthologsBioMART"), dependencies=T)



# install orthologr from GitHub

devtools::install_github("HajkD/orthologr", build_vignettes = TRUE, dependencies = TRUE)

# install orthologr from GitHub
devtools::install_github("HajkD/metablastr")

# install orthologr from GitHub
devtools::install_github("HajkD/orthologr")

# install data.table

install.packages("data.table")

install.packages("seqinr")

#Open libraries:

library(data.table)

library(seqinr)

library(orthologr)

#Directory:

setwd("C:/Users/maria/Downloads/RNA-seq tomato/Translation_Sl_At")

#

query_file <- "ITAG4.1_proteins.fasta" 

query_file2 <- read.fasta(file = query_file, as.string = TRUE, forceDNAtolower = FALSE)

length(query_file2)

subject_file <- "Arabidopsis_thaliana.TAIR10.pep.all.fa"

subject_file2 <- read.fasta(file = subject_file, as.string = TRUE, forceDNAtolower = FALSE)

length(subject_file2)

blast_rec(
  query_file = query_file,
  subject_file = subject_file,
  seq_type = "cds",
  format = "fasta",
  blast_algorithm = "blastp",
  delete_corrupt_cds = TRUE,
  eval = "1E-10",
  max.target.seqs = 100,
  path = NULL,
  comp_cores = 4,
  blast_params = NULL,
  clean_folders = FALSE,
  save.output = NULL
)

