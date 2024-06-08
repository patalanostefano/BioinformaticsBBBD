import_data_ADNI <- function(){
  

# body --------------------------------------------------------------------

  
  filename_in = "ADNI_Gene_Expression_Profile.csv"
    
  
  
  
  tmp <- read.table(filename_in, header=FALSE, sep="\t", row.names = 1, quote="", check.names = F)
  colClasses = sapply(tmp, class)
  rm(tmp)
  
  gene_expr = read.table(filename_in, header=T, sep="\t", row.names = 1, quote = "", check.names = F, colClasses = colClasses)
  
  
# output ------------------------------------------------------------------

  
  
}

