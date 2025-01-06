#!/bin/bash

##### SLURM #####
#SBATCH --job-name=rna_align
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
module load STAR/2.7.3a-GCC-6.4.0-2.28

###### ARRAY #######
wd="/home/flanary/Projects/RA_Resistance"
samples=$wd/"Sen_13cRA_RNA/processing/03_alignment/samples.txt"
line1=$(sed -n "$SLURM_ARRAY_TASK_ID"p "$samples")
echo "line1:$line1"

##### VARIABLES #####
fastq_dir="/data/scratch/flanary/Sen_13cRA_RNA/fastq"
output_dir="/data/scratch/flanary/Sen_13cRA_RNA/bam"

##### COMMANDS #####
echo "Processing sample $line1"

# make output directory
output=$output_dir/$line1
mkdir -p $output

# STAR indices
star_index="/data/project/sen-lab/genome/hg38/star_index"
echo "Using STAR index: $star_index"

# align
echo "FASTQ files: $fastq_dir/$line1_R1_001.fastq.gz, $fastq_dir/$line1_R2_001.fastq.gz"

STAR --runThreadN 8 --genomeDir $star_index \
     --readFilesIn $fastq_dir/"$line1"_R1_001.fastq.gz $fastq_dir/"$line1"_R2_001.fastq.gz \
     --outFileNamePrefix $output/$line1. \
     --outSAMtype BAM SortedByCoordinate \
     --readFilesCommand zcat

echo "Aligned files for $line1 are in: $output"

##### END #####
echo "STAR alignment complete"
