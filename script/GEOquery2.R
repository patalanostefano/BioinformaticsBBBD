GEOquery2 <- function() {
  
  
  # input -------------------------------------------------------------------
  
  series = init_config$series2
  
  
  # body --------------------------------------------------------------------
  
  # STEP 1: Downloading data
  tmp <- getGEO(GEO = series) #show(tmp) mostra i metodi su tmp
  set <- tmp$`GSE63061_series_matrix.txt.gz`
  pData <- phenoData(set)
  metadata <- pData@data
  aData <- assayData(set)
  matrix <- data.frame(aData$exprs)
  matrix<- 2^matrix
  rm(pData,aData,tmp)
  
  
  
  # STEP 2: Preparing data
  annotation <- fData(set)
  geneSymbol <- annotation$ILMN_Gene
  matrix <- matrix[annotation$ID,]
  matrix <-aggregate(matrix,list(geneSymbol),"mean")
  ind <- which(matrix$Group.1 == "")
  if(length(ind) > 0) matrix <- matrix[-ind,]
  rownames(matrix) <- matrix$Group.1
  matrix <- matrix[,-1]
  matrix[is.na(matrix)] <- 0
  rm(set,annotation,ind,geneSymbol)
  ## merge(df1,df2,by=0,all=false)
  ## combat
  
  
  # output ------------------------------------------------------------------
  
  res <- list(metadata=metadata,matrix=matrix)
  
}
