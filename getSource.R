getSource <- function(){
  source("script/initial_config.R")
  source("script/GEOquery1.R")
  source("script/GEOquery2.R")
  source("script/extract_case_control.R")
  source("script/preprocessing.R")
  source("script/filtering.R")
  source("script/p_value_computation.R")
  source("script/p_value_adjustment.R")
  source("script/make_volcano_plot.R")
  source("script/p_value_filtering.R")
  source("script/import_data_GTEx.R")
  source("script/normalize_data_GTEx.R")
  source("script/extract_brain_genes.R")
  source("script/find_common.R")
}

