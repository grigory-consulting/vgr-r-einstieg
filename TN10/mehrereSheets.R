

library(openxlsx)
library(readxl)
library(tidyverse)


#alle blätter einlesenjedes blatt wird zu einer spalte
#region und erzeugnen einer Tabelle

xl_pfad <- "data/regional.xlsx"
sheets <- excel_sheets(xl_pfad)

# map bedeutet wir gehen via alle sheets

kombiniert <- map(sheets, \(s){
read_excel(xl_pfad,sheet=s) |> 
    mutate(region=s) # eine Liste aus drei Tabellen
}) |> 
  bind_rows()


#RDS 
saveRDS(kombiniert,"output/kombiniert.RDS")

kombiniert <- readRDS("output/kombiniert.RDS")
