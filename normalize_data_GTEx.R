normalize_data_GTEx <- function(){
  
  if (!require("BiocManager", quietly = TRUE)) install.packages("BiocManager")
  
  BiocManager::install("DESeq2")
  
  library("DESeq2")
  
  
# input -------------------------------------------------------------------

  genes_reads <- inputGTEx$genes_reads

# gene_reads normalization --------------------------------------------------------------------
  
  
  
  #DESeq2 dataset 
  dds <- DESeqDataSetFromMatrix(countData = genes_reads, colData = row.names(genes_reads), design = ~ tissue)
  
  # Estimating size factors
  genes_reads <- estimateSizeFactors(dds)
  

  
# ouptut ------------------------------------------------------------------

  res <- list(genes_reads=genes_reads)
  
  
}