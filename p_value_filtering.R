p_value_filtering <- function(){

  
  
  prc_IQR <- 0.35
  thr_FC <- 2
  thr_pval <-0.01
  paired <- T
  
  
  
# input -------------------------------------------------------------------

  data <- filtered$data
  dataN <- filtered$dataN
  dataC <- filtered$dataC
  genes <- filtered$genes
  logFC <- filtered$logFC
  pval <- p_value$pval
  pval_adj <- p_value_adj$pval_adj
  

# body --------------------------------------------------------------------

  
  #filtering
  ind <-which(pval_adj >= thr_pval)
  
  if(length(ind) > 0){
    data <- data[-ind,]
    dataC <- dataC[-ind,]
    dataN <- dataN[-ind,]
    genes <- genes[-ind]
    logFC <- logFC[-ind]
    pval <- pval[-ind]
    pval_adj <- pval_adj[-ind]
  }
  
  rm(ind)
  
  direction <- ifelse(logFC > 0, "UP", "DOWN")
  

# output ------------------------------------------------------------------

  res <- list (data=data,
               dataC=dataC,
               dataN=dataN,
               genes=genes,
               logFC=logFC,
               pval=pval,
               pval_adj=pval_adj,
               direction=direction
            )
  
}