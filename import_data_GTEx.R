import_data_GTEx <- function(){
  
  
  
# body --------------------------------------------------------------------

  filename_in_TPM = "GTEx_Analysis_2017-06-05_v8_RNASeQCv1.1.9_gene_tpm.gct"

  
  tmp <- read.table(filename_in_TPM, header=FALSE, sep="\t", row.names = 1, quote="", check.names = F)
  colClasses = sapply(tmp, class)
  rm(tmp)
  
  gene_tpm = read.table(filename_in_TPM, header=T, sep="\t", row.names = 1, quote = "", check.names = F, colClasses = colClasses)
  

  
# output -----------------------------------------------------------------

  res <- list(gene_tpm=gene_tpm)
  
}