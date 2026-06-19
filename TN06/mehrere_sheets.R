library(openxlsx)
library(readxl)
library(tidyverse)

# Plan: Alle Blätter einlesen, jedes Blatt bekommt eine Spalte
# "Region". Anschließend stapeln wir diese Blätter zu einer Tabelle

xl_pfad <- "data/regional.xlsx"
sheets <- excel_sheets(xl_pfad)

# map -> wir gehen über alle sheets und wenden eine Pipe an
kombiniert <- map(sheets, \(s){
  read_excel(xl_pfad, sheet = s) |>
  mutate(region = s) #eine Liste aus drei Datensätzen
}) |>
  bind_rows()

kombiniert

# RDS
saveRDS(kombiniert,"output/kombiniert.RDS")