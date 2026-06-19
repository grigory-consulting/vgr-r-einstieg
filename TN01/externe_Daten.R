

library(readxl) 
# install.packages("openxlsx")
library(openxlsx)

# Ordner 

dir.create("output", showWarnings = FALSE)


xl_pfad <- "data/lieferung_excel.xlsx"
excel_sheets(xl_pfad)

daten <- read_excel(xl_pfad, sheet = "Daten", skip = 3)

meta <- read_excel(xl_pfad, sheet = "Metadaten", col_names = FALSE)
# Colnames = FALSE <-  die ersten Zeile wird nicht zu Spaltennamen konvertiert

# wide <- long aufbereiten 

daten_long <- daten |>
  pivot_longer(
    cols = -c(bereich_code, bereich_name), # alle Zeit- und Wertspalten
    names_to ="zeit",
    values_to = "wert"
  ) |>
# "20xxxQy" <- jahr=20xx und quartal=y zerlegen
  mutate(
    jahr =as.integer(str_sub(zeit,1,4)), # die ersten vier Zeichen
    quartal = as.integer(str_sub(zeit,6,6)) # das letzte Zeichen
    )|>
  select(jahr, quartal, bereich_code, bereich_name, wert) |>
  arrange(jahr, quartal, bereich_code)  # damit schiebe ich jahr, quartal und bereich_code in die ersten drei Spalten des tibble
daten_long


# Summe je Bereich über alle Quartale 2024
res <- daten_long |>
  filter(jahr ==2024)|>
  group_by(bereich_code, bereich_name) |>
  summarise(summe_2024 = sum(wert), .groups = "drop") |>
    arrange(desc(summe_2024))
res
  
# write.xlsx als Einzeiler
  write.xlsx(summe_pro_quartal, "output/ergebnis_summe_2024.xlsx")

# openxlsx
  
wb <- createWorkbook() # wb ist leere Excel-Datei
addWorksheet(wb, "Summe_2024") # neues Blatt hinzufügen
writeData(wb, "Summe_2024", res)
kopf <- createStyle(textDecoration = "bold", fgFill = "#21303f", 
                    fontColour = "#ffffff"
                    )
# Style hinzufügen
addStyle(wb, "Summe_2024", kopf, rows = 1, cols = seq_along(res))
# Breite der Zellen anpassen (automatisch)
# setColWidths(wb, "Summe_2024", cols = seq_along(res), widths = "auto")
setColWidths(wb, "Summe_2024", cols = seq_along(res), widths = c(15, 25, 12))
saveWorkbook(wb, "output/ergebnis_summe_2024_formatiert.xlsx", overwrite = TRUE)

# install.packages("openxlsx2)

wb_workbook() |>  # erstellen leerer Datei 
  