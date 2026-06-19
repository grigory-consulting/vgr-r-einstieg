library(openxlsx)
library(readxl)
library(tidyverse)


#Plan: Alle Blätter einlesen und jedes Blatt bekommt eine Spalte 
#"Region". Anschließend stapeln wir diese Blätter zu einer Tabelle
#Mit negativen Indizes kann ich manche TB weg lassen: sheets[-1]


xl_pfad <- "data/regional.xlsx"
sheets <- excel_sheets(xl_pfad)


#map bedeutet wir gehen über alle sheets
#und wenden eine pipe an

kombiniert <- map(sheets, \(s){
  read_excel(xl_pfad, sheet = s) |>
    mutate(region = s)
}) |>
  bind_rows()
kombiniert



#speichern als rds
saveRDS(kombiniert, "output/kombiniert.RDS")
#rds wieder abrufen
kombiniert <- readRDS("output/kombiniert.RDS")


