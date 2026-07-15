library(readxl)
library(tidyverse)

xl_pfad <- "R/Data/lieferung_excel.xlsx"
excel_sheets(xl_pfad) # Tabellenblätter

read_excel("r/data/Lieferung_excel.xlsx", sheet = 2)
install.packages("tidyverse")

daten <-  daten %>%
  pivot_longer(
    cols = -c(bereich_code, bereich_name),
    names_to = "zeit",
    values_to = "wert"
  )
