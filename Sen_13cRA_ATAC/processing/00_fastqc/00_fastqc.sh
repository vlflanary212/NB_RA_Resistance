#!/bin/bash

##### SLURM #####
#SBATCH --job-name=fastqc_atac
#SBATCH --partition=medium
#SBATCH --time=49:59:59
#SBATCH --nodes=1
#SBATCH --ntasks=16
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=4G
#SBATCH --array=0-15
#SBATCH --output=%x_%A_%a.out
#SBATCH --error=%x_%A_%a.err

##### VARIABLES #####
fastq_dir="/data/project/sen-lab/internal/2024_12_17/Sen_ATAC_cRA"
fastqc_output="/data/scratch/flanary/Sen_13cRA_ATAC/fastqc"

##### PACKAGES #####
module load FastQC/0.11.9-Java-11

##### COMMANDS #####
# Get a list of FASTQ files
fastq_files=(${fastq_dir}/*.fastq.gz)

# Get a single file for the current task
fastq_file=${fastq_files[$SLURM_ARRAY_TASK_ID]}
srun fastqc -o $fastqc_output "$fastq_file"

##### END #####
echo "done"