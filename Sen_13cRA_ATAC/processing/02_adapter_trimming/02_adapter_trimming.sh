#!/bin/bash

##### SLURM #####
#SBATCH --job-name=atac_trim
#SBATCH --partition=short
#SBATCH --time=11:59:59
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=8G
#SBATCH --array=1-8
#SBATCH --output=%x_%A_%a.out
#SBATCH --error=%x_%A_%a.err
#SBATCH --mail-user=flanary@uab.edu
#SBATCH --mail-type=ALL

##### PACKAGES #####
module load Anaconda3

source ~/miniconda3/etc/profile.d/conda.sh
conda activate trim_galore_env || { echo "Failed to activate Conda environment"; exit 1; }

##### VARIABLES #####
fastq_dir="/data/project/sen-lab/internal/2024_12_17/Sen_ATAC_cRA"
output_dir="/data/scratch/flanary/Sen_13cRA_ATAC/trimmed_fastq"
samples="/home/flanary/Projects/RA_Resistance/Sen_13cRA_ATAC/processing/samples.txt"

# Get sample name for this array task
sample=$(sed -n "${SLURM_ARRAY_TASK_ID}p" "$samples")

# Input FASTQ files
r1="$fastq_dir/${sample}_R1_001.fastq.gz"
r2="$fastq_dir/${sample}_R2_001.fastq.gz"

##### COMMANDS #####
echo "Processing sample: $sample"
trim_galore --paired --cores 8 --output_dir "$output_dir" "$r1" "$r2"

if [[ $? -eq 0 ]]; then
  echo "Trimming completed successfully for sample: $sample"
else
  echo "Error during trimming for sample: $sample"
  exit 1
fi

##### END #####
conda deactivate
