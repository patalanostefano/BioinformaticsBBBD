rm(list=ls())
options(stringsAsFactors=F)
setwd("/Users/stefano/Desktop/BIO/PROJECT/myproject")
library(stringr)
library(pheatmap)


# getsource ---------------------------------------------------------------

source("script/getSource.R")

getSource()


# GEO --------------------------------------------------------------------


init_config <- initial_config()

input1 <- GEOquery1()
input2 <- GEOquery2()

merged <- extract_case_control()

preprocessed <- preprocessing()

filtered <- filtering()

p_value <- p_value_computation()

p_value_adj <- p_value_adjustment()

make_volcano_plot()

filtered <- p_value_filtering()

data <- filtered$data
dataN <- filtered$dataN
dataC <- filtered$dataC
genes <- filtered$genes
logFC <- filtered$logFC
direction <- filtered$direction
pval <- filtered$pval
pval_adj <- filtered$pval_adj


# Add a column for significance
diff_expr_results$Significance <- ifelse(diff_expr_results$pval_adj < 0.05, "Significant", "Not Significant")


name_DEG <- data.frame(str_split_fixed(genes,"\\|",2))
colnames(name_DEG)<- c("genesymbol")

results<- data.frame(genes = name_DEG$genesymbol,
                     pval = pval,
                     pval_adj = pval_adj,
                     logFC = logFC,
                     direction = direction)
results <-results[order(results$logFC, decreasing = T),]



# GTExTissueExpr ----------------------------------------------------------

inputGTEx <- import_data_GTEx()

brain_enriched <- extract_brain_genes()



# mapping + DEG -----------------------------------------------------------------

common <- find_common()
common_genes <- common$common_genes
common_data <- common$common_data

data <- data[common_genes,]

name_DEG <- data.frame(str_split_fixed(common_genes,"\\|",2))
colnames(name_DEG)<- c("genesymbol")

results<- data.frame(genes = name_DEG$genesymbol,
                     pval = pval,
                     pval_adj = pval_adj,
                     logFC = logFC,
                     direction = direction)
results <-results[order(results$logFC, decreasing = T),]

results <- results[common_genes,]
results <-results[order(results$logFC, decreasing = T),]
ind <- which(results$direction=="UP")
up_regulated <- results[ind,]
down_regulated <- results[-ind,]

write.table(up_regulated[,1], file = "up_regulated_genes.txt", row.names = FALSE, quote = FALSE)
write.table(down_regulated[,1], file = "down_regulated_genes.txt", row.names = FALSE, quote = FALSE)
write.table(results, "results.txt",col.names = T, row.names = F, sep = "\t", quote = F)

# ADNI --------------------------------------------------------------------

inputADNI <- import_data_ADNI()
