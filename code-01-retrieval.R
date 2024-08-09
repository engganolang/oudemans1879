library(readxl)
library(tidyverse)
library(reactable)

oudemans1889 <- read_xlsx("../enolex-2023-05-23/wordlist/Oudemans_1889_(Francis_wordlist).xlsx")
oudemans1889 |> 
  rename(Francis1870 = Enggano_Francis_1870,
         vdStraaten_Severijn1855 = vdStraaten_Severijn_1855,
         vonRosenberg1855 = vonRosenberg_1855,
         Boewang1854 = Boewang_1854) |> 
  write_tsv("data/oudemans1889.tsv")
