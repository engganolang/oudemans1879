library(tidyverse)

oudemans1879 <- read_tsv("data/oudemans1879.tsv")
oudemans1879

oudlong <- oudemans1879 |> 
  pivot_longer(cols = -c(English, Dutch, Page), names_to = "Source", values_to = "Forms") |> 
  separate_wider_delim(cols = Source, delim = "__", names = c("Source", "Year")) |> 
  mutate(Source = factor(Source, 
                         levels = c("Francis", "vdStraaten_Severijn", 
                                    "vonRosenberg", "Boewang")),
         Year = factor(Year,
                       levels = c("1854", "1855", "1870"))) |> 
  select(Page, Dutch, English, Enggano = Forms, Year, Source)
oudlong |> 
  write_tsv("data/oudemans1879-long.tsv")
