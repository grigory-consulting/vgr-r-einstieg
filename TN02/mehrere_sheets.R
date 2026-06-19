

library(openxlsx)
library(readxl)
library(tidyverse)

# Plan: Alle Blätter einlesen, jedes Blatt bekommt eine Spalte
# "region". anschließend stapeln wir diese blätter zu einer tabelle

xl_pfad <- "regional.xlsx"
sheets <- excel_sheets(xl_pfad)

# map bedeutet, wir gehen über alle sheets
# und wenden eine pipe an
kombiniert <- map(sheets, \(s){
  read_excel(xl_pfad, sheet = s) |>
    mutate(region = s) # eine liste aus drei datensätzen
}) |>
  bind_rows()
kombiniert

# RDS
saveRDS(kombiniert, "output/kombiniert.RDS")

kombiniert <- readRDS("output/kombiniert.RDS")
