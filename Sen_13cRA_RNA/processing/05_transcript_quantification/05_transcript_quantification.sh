#!/bin/bash

##### SLURM #####
#SBATCH --job-name=tx_quant
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
bam_dir="/data/scratch/flanary/Sen_13cRA_RNA/bam"
output_dir="/data/scratch/flanary/Sen_13cRA_RNA/"

###### ARRAY #######
samples="/home/flanary/Projects/RA_Resistance/Sen_13cRA_RNA/processing/03_alignment/samples.txt"
line1=$(sed -n "$SLURM_ARRAY_TASK_ID"p "$samples")
echo "line1:$line1"

##### COMMANDS #####
# gtf file
gtf="/data/project/sen-lab/genome/hg38/gencode.v22.annotation.gtf"

# get counts
featureCounts -p -T 8 -t exon -g gene_id -a $gtf -o $output_dir/raw_counts.txt $bam_dir/$line1.rmdup.bam

# edit counts
cat $output_dir/raw_counts.txt| cut -f1,7- | sed 1d > $output_dir/counts.txt

##### END #####
echo "Transcript quantification complete for $line1"
conda deactivate