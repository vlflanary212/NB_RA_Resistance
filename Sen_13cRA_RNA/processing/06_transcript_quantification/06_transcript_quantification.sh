#!/bin/bash

##### SLURM #####
#SBATCH --job-name=rna_bam
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

###### ARRAY #######
samples="/home/flanary/Projects/RA_Resistance/Sen_13cRA_RNA/processing/03_alignment/samples.txt"
line1=$(sed -n "$SLURM_ARRAY_TASK_ID"p "$samples")
echo "line1:$line1"

##### PACKAGES #####
module load SAMtools/1.9-foss-2018b

##### VARIABLES #####
bam_dir="/data/scratch/flanary/Sen_13cRA_RNA/bam"
output=$bam_dir/$line1

# gtf file
gtf="/data/project/sen-lab/genome/hg38/gencode.v22.annotation.gtf"

# get counts
featureCounts -p -T 8 -t exon -g gene_id -a $gtf -o $output/raw_counts.txt $output/$line1.rmdup.bam

# edit counts
cat $output/raw_counts.txt| cut -f1,7- | sed 1d > $output/counts.txt