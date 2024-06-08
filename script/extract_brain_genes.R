extract_brain_genes <- function(){
  
 # library(DESeq2)


# input -------------------------------------------------------------------

  gene_tpm <- inputGTEx$gene_tpm
  
# gene_TPM extraction ----------------------------------------------------------------------
  genes <- gene_tpm$Description

  gene_tpm <- gene_tpm[,-1]
  
  gene_tpm <- aggregate(gene_tpm,list(genes),"mean")
  
  genes <- gene_tpm$Group.1
  
  row.names(gene_tpm) <- genes
  gene_tpm <- gene_tpm[,-1]
  
  
  # Filtering for brain tissues
  brain_cols <- grep("Brain", colnames(gene_tpm), ignore.case = TRUE)
  brain_expr <- gene_tpm[,brain_cols]
  non_brain_expr <- gene_tpm[,-brain_cols]
  
  
  highly_expressed <- which(max(brain_expr) >= 4* rowMeans(non_brain_expr))
  brain_enriched <- gene_tpm[highly_expressed,]
  
  genes <- rownames(brain_enriched)
  
  overall_mean <- rowMeans(brain_enriched, na.rm=T) 
  ind<-which(overall_mean == 0) 
  
  if(length(ind)>0){
    brain_enriched <- brain_enriched[-ind,]
    genes <- genes[-ind]
  }
  

# ouptut ------------------------------------------------------------------
  res <- list(genes=genes, brain_enriched=brain_enriched)

}
