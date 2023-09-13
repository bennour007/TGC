# load libraries
library(tidyverse)

# load, unite, and clean data
files <- list.files(path="../gt_data/")

data <- map(files, function(x) readxl::read_xlsx(paste0("../gt_data/",x)))

data_united <- data |> 
  bind_rows() |> 
  janitor::clean_names()


write_csv(data_united, here::here("epi_reports_staging","data", "clean", "hiv_malawi.csv"))
