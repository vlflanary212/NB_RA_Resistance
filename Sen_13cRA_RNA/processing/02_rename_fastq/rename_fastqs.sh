#!/bin/bash

# Directory containing FASTQ files
fastq_dir="/data/scratch/flanary/Sen_13cRA_RNA/fastq"

# Mapping file: contains original prefix and new cell line name
mapping_file="/home/flanary/Projects/RA_Resistance/Sen_13cRA_RNA/processing/02_rename_fastq/mapping.txt"

# Loop through each mapping entry
while IFS=$'\t' read -r old_prefix new_name; do
  # Find files matching the old prefix
  for file in "${fastq_dir}/${old_prefix}"*; do
    if [[ -f $file ]]; then
      # Replace the old prefix with the new name
      new_file="${file/${old_prefix}/${new_name}}"
      echo "Renaming $file to $new_file"
      mv "$file" "$new_file"
    fi
  done
done < "$mapping_file"
