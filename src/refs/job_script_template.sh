#!/bin/bash

##### SLURM #####
#SBATCH --job-name=
#SBATCH --partition=
#SBATCH --time=00:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=128G
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err

##### VARIABLES #####
# directories
wd=""  # working directory

# files

##### PACKAGES ######
module load 

##### COMMANDS #####
# code to run in the background

##### END #####
echo "done"
