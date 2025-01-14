#!/bin/bash 

##### SLURM #####
#SBATCH --job-name=mes_motif
#SBATCH --partition=medium
#SBATCH --time=23:59:59
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=128G
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err

##### DIRECTORIES #####
# working directory
wd="/home/flanary/Projects/RA_Resistance/Sen_13cRA_ATAC/analysis/diff_motif_analysis"
# reference genome
hg38="/data/project/sen-lab/genome/hg38/bwa/Homo_sapiens_assembly38.fasta"
# bed files
## input bed files
in_mes=$wd/"inputs/mes_upreg.bed"
in_adr=$wd/"inputs/adr_upreg.bed"
## background bed file
bg=$wd/"nonsig.bed"
# output directory
out_mes=$wd/"mes_motifs"
out_adr=$wd/"adr_motifs"

##### PACKAGES ######
module load rc-base
module load rc/HOMER/4.9

##### COMMANDS #####
findMotifsGenome.pl $in_mes $hg38 $out_mes/ -bg $bg -size 1000 -nomotif -gc -mask -mset vertebrates -p 12
findMotifsGenome.pl $in_adr $hg38 $out_adr/ -bg $bg -size 1000 -nomotif -gc -mask -mset vertebrates -p 12

# Finish 
echo "done"