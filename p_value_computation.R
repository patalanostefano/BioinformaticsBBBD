p_value_computation <- function(){
  

  
  prc_IQR <- 0.35
  thr_FC <- 2
  thr_pval <-0.01
  paired <- T
  
  
  
# input -------------------------------------------------------------------
  data <- filtered$data
  dataC <- filtered$dataC
  dataN <- filtered$dataN
    

# body --------------------------------------------------------------------

  #p-value computation
  
  N <- ncol(dataC)
  M <- ncol(dataN)
  
  pval <- apply(data, 1,function(x){
    res <- t.test(x[1:N],x[(N+1):(M+N)], paired = FALSE)
    pval <- res$p.value
  })
  
# output ------------------------------------------------------------------

  res <- list(pval=pval)

  
}