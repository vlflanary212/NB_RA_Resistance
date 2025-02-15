#!/bin/bash

##### SLURM #####
#SBATCH --job-name=multiqc_rna
#SBATCH --partition=express
#SBATCH --time=01:59:59
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=4G
#SBATCH --output=%x_%A_%a.out
#SBATCH --error=%x_%A_%a.err
#SBATCH --mail-user=flanary@uab.edu
#SBATCH --mail-type=ALL

##### VARIABLES #####
wd="/home/flanary/Projects/RA_Resistance/Untreated_RNA/processing/02_pre-alignment_qc"
fastqc_output=$wd/"fastqc/fastqc_outputs"
multiqc_output=$wd/"multiqc_outputs"

##### PACKAGES #####
module load MultiQC/0.8

##### COMMANDS #####
multiqc -v $fastqc_output -o $multiqc_output

##### END #####
echo "done"
