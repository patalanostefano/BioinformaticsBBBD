make_volcano_plot <- function(){
  

  
  prc_IQR <- 0.35
  thr_FC <- 1.05
  thr_pval <-0.01
  paired <- T
  
  
  
  
# input -------------------------------------------------------------------

  logFC <- filtered$logFC
  pval_adj <- p_value_adj$pval_adj
  

# body --------------------------------------------------------------------

  #volcano plot
  
  plot(logFC,-log10(pval_adj))
  
  abline(v = c(-log2(thr_FC), log2(thr_FC)), lty = 2, lwd = 4, col = "red")
  abline(h = -log10(thr_pval), lty = 2, lwd = 4, col = "blue")
  
  
}