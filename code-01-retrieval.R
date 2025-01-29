library(readxl)
library(tidyverse)
library(reactable)

oudemans1889 <- read_xlsx("../enolex-2023-05-23/wordlist/Oudemans_1889_(Francis_wordlist).xlsx")
oudemans1889 |> 
  rename(Francis__1870 = Enggano_Francis_1870,
         vdStraaten_Severijn__1855 = vdStraaten_Severijn_1855,
         vonRosenberg__1855 = vonRosenberg_1855,
         Boewang__1854 = Boewang_1854) |> 
  write_tsv("data/oudemans1879.tsv")
