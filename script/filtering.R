filtering <-function(){
  
  
# threshold ---------------------------------------------------------------
  
  
  prc_IQR <- 0.35
  thr_FC <- 1.05
  thr_pval <-0.01
  paired <- T
  
  

# input -------------------------------------------------------------------

  
  data <- preprocessed$data
  dataN <- preprocessed$dataN
  dataC <- preprocessed$dataC
  genes <- preprocessed$genes
  
  

# body --------------------------------------------------------------------


  
  #we now compute the fold-change = mean(C)/mean(N) (with log2: log FOLDchange) and then again looking at the ones under the log of thr_FC: 
  
  
  logFC <- rowMeans(dataC, na.rm=T) - rowMeans(dataN, na.rm=T)
  
  hist(logFC, main="FC (logarithmic) frequency distribution", breaks=100, xlab="log2FC", ylab="Frequency", col="red")
  abline(v=c(-log2(thr_FC), log2(thr_FC)))
  

  ind <- which(abs(logFC)<log2(thr_FC))
  
  
  if(length(ind)>0){
    data <- data[-ind,]
    dataC <- dataC[-ind,]
    dataN <- dataN[-ind,]
    genes <- genes[-ind]
    logFC<-logFC[-ind]
  }
  
  

# output ------------------------------------------------------------------

  res <- list(data=data, dataN=dataN, dataC=dataC, genes=genes, logFC=logFC)  
  
  
}
