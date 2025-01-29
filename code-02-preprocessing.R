library(tidyverse)

oudemans1889 <- read_tsv("data/oudemans1889.tsv")
oudemans1889

oudlong <- oudemans1889 |> 
  pivot_longer(cols = -c(English, Dutch, Page), names_to = "Source", values_to = "Forms") |> 
  separate_wider_delim(cols = Source, delim = "__", names = c("Source", "Year")) |> 
  mutate(Source = factor(Source, 
                         levels = c("Francis", "vdStraaten_Severijn", 
                                    "vonRosenberg", "Boewang")),
         Year = factor(Year,
                       levels = c("1854", "1855", "1870"))) |> 
  select(Page, Dutch, English, Enggano = Forms, Year, Source)
oudlong |> 
  mutate(across(where(is.character), ~replace_na(., ""))) |> 
  write_tsv("data/oudemans1889-long.tsv")
oudlong |> 
  mutate(across(where(is.character), ~replace_na(., ""))) |> 
  write_csv("data/oudemans1889-long.csv")
