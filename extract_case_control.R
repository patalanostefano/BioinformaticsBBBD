extract_case_control <- function(){
  
  if(!requireNamespace("BiocManager",quietly = TRUE)) install.packages("BiocManager")

  BiocManager::install("sva")
  library("sva")

  

# inputs -------------------------------------------------------------------

  metadata1 <- input1$metadata
  matrix1 <- input1$matrix
  
  metadata2 <- input2$metadata
  matrix2 <- input2$matrix

# body --------------------------------------------------------------------
  
  #merging and normalization
  
  metadata <- rbind(metadata1, metadata2)
  
  matrix <- merge(matrix1,matrix2,by=0,all=FALSE)
  genes <- matrix$Row.names
  matrix <- matrix[,-1]

  matrix <- ComBat(matrix, batch = as.factor(c(rep(1, ncol(matrix1)), rep(2, ncol(matrix2)))))
  
  
  
  row.names(matrix) <- genes
  

  
  ############################################
  #STEP 3: Extracting AD, MCI and normal samples
  ###########################################
  list <- split(metadata$geo_accession,metadata$`status:ch1`)
  
  normal <- list$`CTL`
  case <- c(list$`MCI`,list$`AD`)

  data <- matrix[,c(normal,case)]
  dataN <- matrix[,normal]
  dataC <- matrix[,case]
  #metadata <- metadata[c(normal,case),]
  genes <- row.names(data)
  rm(list,matrix)
  
 

# output ------------------------------------------------------------------

  
  res <- list(data=data,
              dataN=dataN,
              dataC=dataC,
              genes=genes)
  
}