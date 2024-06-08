initial_config <- function(){

# body --------------------------------------------------------------------

  
#  BiocManager::install("GEOquery")
#  readr::local_edition(1)
  library("GEOquery")
  ##### Set Results folder ####
  dirRes <- "Results/"
  if (!dir.exists(dirRes)){
    dir.create(dirRes)
  }else{
    print(paste("The
  directory",dirRes,"already exists"))
  }
  dataset <- "GEO_HCC"
  dirDataset <- paste0(dirRes,dataset,"/")
  if (!dir.exists(dirDataset)){
    dir.create(dirDataset)
  }else{
    print(paste("The
  directory",dirDataset,"already exists"))
  }

  series1 = "GSE63060"
  series2 = "GSE63061"

# output ------------------------------------------------------------------

  
  res <- list(series1=series1, series2=series2)
  
}
