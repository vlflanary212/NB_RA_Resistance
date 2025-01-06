#!/bin/bash

##### SLURM #####
#SBATCH --job-name=multiqc_atac
#SBATCH --partition=express
#SBATCH --time=01:59:59
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=4G
#SBATCH --output=%x_%A_%a.out
#SBATCH --error=%x_%A_%a.err

##### VARIABLES #####
fastqc_output="/data/scratch/flanary/Sen_13cRA_ATAC/fastqc"
multiqc_output="/data/scratch/flanary/Sen_13cRA_ATAC/multiqc"

##### PACKAGES #####
module load MultiQC/0.8

##### COMMANDS #####
multiqc -v $fastqc_output -o $multiqc_output

##### END #####
echo "done"