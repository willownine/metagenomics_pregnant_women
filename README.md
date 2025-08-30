Hypothyroidism in Pregnant Women: A Metagenomics Approach
📌 Project Overview

This repository contains the research project "Hypothyroidism in Pregnant Women: A Metagenomics Approach", submitted in partial fulfillment of the requirements for the degree of Master of Science in Bioinformatics at Garden City University, Bangalore (2024–2025).

The study explores the relationship between gut microbiota and hypothyroidism during pregnancy using metagenomics (16S rRNA sequencing), QIIME 2 analysis, AI/ML models, and statistical workflows.

🎯 Objectives

Investigate gut microbiome composition in hypothyroid vs. healthy pregnant women.

Apply bioinformatics pipelines (QIIME 2, Trimmomatic, MultiQC, NCBI BLAST, iTOL) for microbial profiling.

Use AI/ML tools for organism classification and biomarker discovery.

Identify disease-associated microbes and their potential role in hypothyroidism.

🧬 Methodology

Data Collection: 120 fecal samples (60 healthy controls, 60 hypothyroid pregnant women) retrieved from SRA/ENA.

Sequencing: 16S rRNA sequencing (Illumina platform).

Quality Control: MultiQC (pre- and post-trimming).

Trimming: Trimmomatic pipeline.

Metagenomic Analysis: QIIME 2 → OTU table generation.

Organism Identification: NCBI BLAST.

Taxonomic Visualization: iTOL.

AI/ML Integration: ChatGPT, Perplexity, and Python (Google Colab) for data interpretation.

Validation: Literature correlation via PubMed.

📊 Key Findings

Microbial Diversity:

Control: ~4945 species

Hypothyroid: ~144 species

Pathogenic Species Identified:

Streptococcus periodonticum

Escherichia fergusonii (ATCC 35469)

Both organisms showed ~7% abundance in hypothyroid samples vs <0.7% in controls.

Reduced beneficial taxa (Bifidobacterium, Lactobacillus, Faecalibacterium) in hypothyroid group.

🔧 Tools & Technologies

Operating System: Ubuntu 24.04 LTS

QC & Trimming: MultiQC, Trimmomatic

Metagenomic Analysis: QIIME 2

Taxonomy: NCBI BLAST, iTOL

AI/ML: Python (Google Colab), ChatGPT, Perplexity

Databases: NCBI SRA, ENA, PubMed

🚀 Scope for Future Work

Integration of multi-omics (metabolomics, transcriptomics).

Strain-level and functional annotation for deeper insights.

Expansion of sample size and validation via clinical studies.

Development of non-invasive biomarkers for early hypothyroidism detection.

AI-driven predictive models for personalized prenatal care.

👨‍💻 Author

Dhruva Tirumalasetty

📧 Contact: tdhruva970@gmail.com


📜 License

This project is licensed under the MIT License – feel free to use, modify, and distribute with attribution.