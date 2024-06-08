find_common <- function(){

# input -------------------------------------------------------------------
 genes <- filtered$genes
 brain_genes <- brain_enriched$genes
 data <- filtered$data
 brain_data <- brain_enriched$brain_enriched

# body --------------------------------------------------------------------
 
 common_genes <- intersect(genes, brain_genes)
 common_data <- data[common_genes,]
 
 
# output ------------------------------------------------------------------

  res <- list(common_data=common_data, common_genes=common_genes)
}
