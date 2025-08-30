#!/bin/bash

# Define the directory containing your fastq files
fastq_dir="/home/dhruva/Downloads/test3"  # Corrected directory

# Output file for the manifest
manifest_file="manifest.tsv"  # Use .tsv extension for tab-separated values

# Print the header (with tabs between column names)
echo -e "sample-id\tforward-absolute-filepath\treverse-absolute-filepath" > "$manifest_file"

# Loop through each sample's _1 (forward) fastq file and generate entries
for f in "$fastq_dir"/*_1.fastq; do
  # Ensure we only process files that exist
  if [[ -e $f ]]; then
    # Extract the sample ID by removing the directory path and _1.fastq
    base_sample=$(basename "$f" _1.fastq)
    
    # Create sample ID based on the base_sample
    sample_id="${base_sample}"
    
    # Construct the reverse read filename and check if it exists
    reverse_file="${f/_1.fastq/_2.fastq}"
    
    # Debugging statements
    echo "Processing forward file: $f"
    echo "Sample ID: $sample_id"
    
    # Write the entry to the manifest if the reverse file exists
    if [[ -e $reverse_file ]]; then
      echo -e "$sample_id\t$f\t$reverse_file" >> "$manifest_file"
      echo "Found reverse file: $reverse_file"
    else
      echo "Warning: Reverse file not found for sample $base_sample: $reverse_file"
    fi
  else
    echo "Warning: Forward file not found: $f"
  fi
done

echo "Manifest file created: $manifest_file"

