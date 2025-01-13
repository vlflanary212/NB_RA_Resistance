#!/bin/bash

##### SLURM #####
#SBATCH --job-name=fastqc_rna
#SBATCH --partition=short
#SBATCH --time=11:59:59
#SBATCH --nodes=1
#SBATCH --ntasks=43
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=4G
#SBATCH --array=0-42
#SBATCH --mail-user=flanary@uab.edu
#SBATCH --mail-type=ALL

##### VARIABLES #####
fastq_dir="/data/scratch/flanary/Untreated_RNA/fastq"
fastqc_output="/home/flanary/Projects/RA_Resistance/Untreated_RNA/processing/02_pre-alignment_qc/fastqc/fastqc_outputs"

##### PACKAGES #####
module load FastQC/0.11.9-Java-11

##### COMMANDS #####
# Get a list of FASTQ files
fastq_files=(${fastq_dir}/*.fastq)

# Get a single file for the current task
fastq_file=${fastq_files[$SLURM_ARRAY_TASK_ID]}
srun fastqc -o $fastqc_output "$fastq_file"

##### END #####
echo "done"
