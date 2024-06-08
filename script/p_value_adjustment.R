p_value_adjustment <- function(){
  

# input -------------------------------------------------------------------

  pval <- p_value$pval
 
# body --------------------------------------------------------------------

  pval_adj <- p.adjust(pval, method = "fdr")

# output ------------------------------------------------------------------

  res <- list(pval_adj=pval_adj)
}
