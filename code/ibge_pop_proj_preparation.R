
# Library -----------------------------------------------------------------
library(tidyverse)

source("code/functions/download_ibge_pop_proj.R")
source("code/functions/has_no_na_column.R")
# source("code/functions/prep_ibge_pop_proj.R")
source("code/functions/read_ibge_pop_proj.R")


download_ibge_pop_proj(filename = "data/pop_ibge_proj_2010-2060.xls")

df <- read_ibge_pop_proj(file = "data/pop_ibge_proj_2010-2060.xls")

write_csv(df, paste0(here::here("output/data_pop_ibge_proj_2010-2016.csv")))
