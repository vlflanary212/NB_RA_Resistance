#!/bin/bash

##### SLURM #####
#SBATCH --job-name=
#SBATCH --partition=
#SBATCH --time=00:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=128G
#SBATCH --array=1-     #designate number of inputs to run in parallel
#SBATCH --output=%x_%A_%a.out
#SBATCH --error=%x_%A_%a.err

##### WORKING DIRECTORY #####
wd="/data/project/sen-lab/Victoria/Neuroblastoma_EDA"

##### ARRAY #####
sample_list=$wd"/doc/..."
sample=$(sed -n "$SLURM_ARRAY_TASK_ID"p "$sample_list")
echo "sample:$sample"

##### VARIABLES #####
# directories

# files

##### PACKAGES ######
module load

##### COMMANDS #####
# task to run in parallel

##### END #####
echo "done"

