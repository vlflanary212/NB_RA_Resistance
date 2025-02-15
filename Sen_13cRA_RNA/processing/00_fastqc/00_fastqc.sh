#!/bin/bash

##### SLURM #####
#SBATCH --job-name=fastqc_rna
#SBATCH --partition=medium
#SBATCH --time=49:59:59
#SBATCH --nodes=1
#SBATCH --ntasks=16
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=4G
#SBATCH --array=0-19
#SBATCH --mail-user=flanary@uab.edu
#SBATCH --mail-type=ALL

##### VARIABLES #####
fastq_dir="/data/project/sen-lab/internal/2024_12_17/Sen_RNA_cRA"
fastqc_output="/data/scratch/flanary/Sen_13cRA_RNA/fastqc"

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