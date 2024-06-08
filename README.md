### BioinformaticsBBBD
This repository contains the code of the Bioinformatics project: Blood Biomarkers for brain diseases.
A differential expression analysis was conducted on AD,MCI patients blood expression profiles from GEO datasets: GSE63060,GSE63061, the results were mapped to the organ enriched genes (according to NCBI definition: "a gene is enriched if it is expressed at least four times higher in a single organ compared to any other organ.") from GTEx-Bulk-tissue-expression-V8 dataset using gene TPM.


# Contents
- [Datasets](#DATASETS)
- [Data Preprocessing](#PREPROCESSING)
- [Deg](#DEG)
- [Results](#RESULTS)




# DATASETS

GSE63060,GSE63061.
GTEx-Bulk-tissue-expression-V8.




# PREPROCESSING

Batch normalization for GEO datasets as 63060, 63061 were 2 batches of the same cohort.
Brain tissues columns extraction for GTEx data.




# DEG 

IQR filtering.
LogFC filtering.
pval-adj filtering.
deg analysis.




# RESULTS

An enrichment analysis was conducted on the resulting genes, using Enrichr and EnrichrKG. Finding a strong (p-val: e-28) correlation between 2 out of 11 genes involved in ATP synthesis mitochondrial processes with many brain diseases.
Recent articles confirm (using different methods: LASSO, SVM) these two genes are candidates to predict LO-AD and MCI. 
Further analysis will be conducted on other GWAS datasets as ADNI. 
Also, as partial inhibition of mitochondrial-complex-I has been exploited as therapeuthic target for AD, further analysis can be conducted on these 2-11 genes using MIENTURENET to evaluate the potential RNA therapeutic approaches for AD.
