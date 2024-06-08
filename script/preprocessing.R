preprocessing <- function(){
  

# threshold ---------------------------------------------------------------


  prc_IQR <- 0.35
  thr_FC <- 2
  thr_pval <-0.01
  paired <- F
  

  
  
# input ------------------------------------------------------------------

  data<-merged$data
  dataC<-merged$dataC
  dataN<-merged$dataN
  genes<-merged$genes
  
  nrow(data)
  
  

# body --------------------------------------------------------------------

  
  #first we compute the mean for each row and eliminate all the genes that have the value=1 
  
  overall_mean <- rowMeans(data, na.rm=TRUE) 
  ind<-which(overall_mean == 0) 
  
  if(length(ind)>0){
    data <- data[-ind,]
    dataC <- dataC[-ind,]
    dataN <- dataN[-ind,]
    genes <- genes[-ind]
  }
  
  rm(ind)
  #now we transform data in logarithmic: can help mantain a normal distr. var and also in this case could help reducing the scale
  #since min(data)=0 => we must apply log (data+1)
  
  #data[data < 0] <- 0  
  #dataN[dataN < 0] <- 0
  #dataC[dataC < 0] <- 0
  
  
  data <- log2(data+1)
  dataC <- log2(dataC+1)
  dataN <- log2(dataN+1)
  
  #now we want to compute for each gene its IQR then we will have a distribution of these IQR and we can decide a treshold to eleminate some genes
  
  IQR_value <-apply(data,1,IQR,na.rm=TRUE)
  thr_IQR <- quantile(IQR_value,prc_IQR,na.rm=TRUE)
 
  
  hist(IQR_value, breaks =100, col ="blue", xlab="IQR_value", ylab="Frequency", main="IQR distribution")
  #to see the treshold on the graph
  abline(v = thr_IQR, col="red", lty= 2, lwd= 4)
  
  
  ind <- which(IQR_value <= thr_IQR)
  
  
  if(length(ind)>0){
    data <- data[-ind,]
    dataC <- dataC[-ind,]
    dataN <- dataN[-ind,]
    genes <- genes[-ind]
  }
  

# output ------------------------------------------------------------------

  
  res <- list(data=data, dataN=dataN, dataC=dataC, genes=genes, IQR_value=IQR_value)
  
}
