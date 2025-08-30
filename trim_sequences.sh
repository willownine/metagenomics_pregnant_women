#!/bin/bash

# Define paths
TRIMMOMATIC_JAR="/media/admin1/gcu2tb_2/NGS/sratoolkit.current-ubuntu64/sratoolkit.3.2.0-ubuntu64/Trimmomatic/Trimmomatic-0.39/trimmomatic-0.39.jar"  # Update with correct path
INPUT_DIR="path to sequences"
OUTPUT_DIR="${INPUT_DIR}/trimmed_seq"
ADAPTERS_PE="/media/admin1/gcu2tb_2/NGS/sratoolkit.current-ubuntu64/sratoolkit.3.2.0-ubuntu64/Trimmomatic/Trimmomatic-0.39/adapters/TruSeq3-PE.fa"  # Update the path to PE adapter file
ADAPTERS_SE="/media/admin1/gcu2tb_2/NGS/sratoolkit.current-ubuntu64/sratoolkit.3.2.0-ubuntu64/Trimmomatic/Trimmomatic-0.39/adapters/TruSeq3-SE.fa"  # Update the path to SE adapter file

# Create output directory if it does not exist
mkdir -p "$OUTPUT_DIR"

# Loop through all FASTQ files in the input directory
for file in ${INPUT_DIR}/*.fastq.gz; do
    # Get the base name of the file
    base=$(basename "$file" .fastq.gz)

    # Check if it's a paired-end read (_1.fastq.gz)
    if [[ "$file" == *_1.fastq.gz ]]; then
        pair="${INPUT_DIR}/${base%_1}_2.fastq.gz"  # Find the corresponding _2 file

        if [[ -f "$pair" ]]; then
            # Paired-end processing
            echo "Processing paired-end: $base and $(basename "$pair")"

            # Define output file names for PE reads
            TRIM_FWD="${OUTPUT_DIR}/${base}_1.trimmed.fastq.gz"
            TRIM_REV="${OUTPUT_DIR}/${base}_2.trimmed.fastq.gz"
            UNPAIRED_FWD="${OUTPUT_DIR}/${base}_1.unpaired.fastq.gz"
            UNPAIRED_REV="${OUTPUT_DIR}/${base}_2.unpaired.fastq.gz"

            # Run Trimmomatic for paired-end reads
            java -jar "$TRIMMOMATIC_JAR" PE -threads 8 \
                "$file" "$pair" \
                "$TRIM_FWD" "$UNPAIRED_FWD" \
                "$TRIM_REV" "$UNPAIRED_REV" \
                ILLUMINACLIP:"$ADAPTERS_PE":2:30:10 \
                LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36

            echo "Finished PE trimming for: $base"

        fi
    elif [[ "$file" != *_2.fastq.gz ]]; then
        # Single-end processing (only if it's not a _2 file)
        echo "Processing single-end: $base"

        # Define output file names for SE reads
        TRIM_SE="${OUTPUT_DIR}/${base}.trimmed.fastq.gz"

        # Run Trimmomatic for single-end reads
        java -jar "$TRIMMOMATIC_JAR" SE -threads 8 \
            "$file" "$TRIM_SE" \
            ILLUMINACLIP:"$ADAPTERS_SE":2:30:10 \
            LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36

        echo "Finished SE trimming for: $base"
    fi
done

echo "All sequences have been trimmed and saved in $OUTPUT_DIR"
