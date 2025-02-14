# BBBD: Blood Biomarkers for Brain Diseases

## Overview
This project analyzes blood-based biomarkers for brain diseases, particularly focusing on Alzheimer's Disease (AD) and Mild Cognitive Impairment (MCI). The analysis uses gene expression data from blood samples and cross-references it with tissue-specific expression data to identify brain-enriched genes.

## Datasets

### GEO AddNeuroMed Cohort
- **Batch 1 (GSE63060)**
  - 145 AD samples
  - 80 MCI samples
  - 104 healthy controls (CTL)
  
- **Batch 2 (GSE63061)**
  - 175 AD samples
  - 78 MCI samples
  - 135 healthy controls (CTL)

### GTEx Data
- Version: V8
- Scope: Bulk tissue expression
- Coverage: 56,200 genes across 49 tissues (including 18 brain tissues)
- Measurement: Gene TPM (Transcripts Per Million)

## Methodology

### Data Preparation

1. **Batch Normalization**
   - Cross-batch normalization for GEO datasets
   - Standardization of expression values

2. **Brain-Enriched Gene Filtering**
   Based on NCBI definition: genes expressed at least 4x higher in brain compared to other organs
   
   Two filtering approaches:
   - **Filtering 1**: mean(brain subtissues) > 4 * mean(other tissues)
   - **Filtering 2**: brain subtissue > 4 * mean(other tissues)

### Data Processing Pipeline

1. **Initial Filtering**
   - Row means filtering
   - Interquartile Range (IQR) filtering
   - Log Fold Change (LogFC) filtering

2. **Statistical Analysis**
   - P-value computation
   - P-value adjustment for multiple testing
   - Significance filtering (threshold = 0.01)

## Results

An enrichment analysis was conducted on the resulting genes, using Enrichr and EnrichrKG. Finding a strong (p-val: e-28) correlation between 2 out of 11 genes involved in ATP synthesis mitochondrial processes with many brain diseases. <br>
Recent articles confirm (using different methods: LASSO, SVM) these two genes are candidates to predict LO-AD and MCI. <br> 
Further analysis will be conducted on other GWAS datasets as ADNI. 
Also, as partial inhibition of mitochondrial-complex-I has been exploited as therapeuthic target for AD, further analysis can be conducted on these 2-11 genes using MIENTURENET to evaluate the potential RNA therapeutic approaches for AD. <br>

## Future Directions

### Planned Extensions
1. **ADNI Dataset Integration**
   - Additional validation of findings
   - Cross-cohort analysis

2. **GWAS Analysis**
   - Integration with genetic variant data
   - Investigation of genetic associations


## Data Access
- GEO datasets: GSE63060, GSE63061
- GTEx data: V8 release


## Author
Stefano Patalano (2024)


