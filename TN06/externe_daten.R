library(readxl)
#install.packages("openxlsx")
library(openxlsx)

# Ordner

dir.create("output", showWarnings = FALSE)

xl_pfad <- "data/lieferung_excel.xlsx"
excel_sheets(xl_pfad)

daten <- read_excel(xl_pfad, sheet = "Daten", skip = 3)

meta <- read_excel(xl_pfad, sheet = "Metadaten", col_names = FALSE)


# wide -> long aufbereiten

daten_long <- daten |>
  pivot_longer(
    cols = -c(bereich_code, bereich_name), # alle Zeit- und Wertspalten
    names_to = "zeit",
    values_to = "wert"
  ) |>
  mutate(
  jahr = as.integer(str_sub(zeit,1,4)), # die ersten 4 Zeichen
  quartal = as.integer(str_sub(zeit,6,6)) # das letzte Zeichen
  ) |>
  select(jahr, quartal, bereich_code, bereich_name, wert) |>
  arrange(jahr, quartal, bereich_code)

# Summe je Bereich über alle Quartale 2024
res <- daten_long |>
  filter(jahr == 2024) |>
  group_by(bereich_code, bereich_name) |>
  summarise(summe_2024 = sum(wert), .groups = "drop") |>
  arrange(desc(summe_2024))

# write.xlsx als Einzeiler
write.xlsx(res, "output/ergebnis_summe_2024.xlsx", overwrite = TRUE )

# openxlsx

wb <- createWorkbook() # wb ist eine leere Excel-Datei
addWorksheet(wb, "Summe_2024") #neues Blatt hinzufügen
writeData(wb, "Summe_2024", res)
kopf <-  createStyle(textDecoration = "bold", fgFill = "#21303f",
                     fontColour = "#ffffff"
                     )
# Style hinzufügen
addStyle(wb, "Summe_2024", kopf, rows = 1, cols = seq_along(res))
# Breite der Zellen anpassen
# setColWidths(wb, "Summe_2024", cols = seq_along(res), widths = "auto")
setColWidths(wb, "Summe_2024", cols = seq_along(res), widths = c(15,25,12))
saveWorkbook(wb, "output/ergebnis_summe_2024_formatiert.xlsx", overwrite = TRUE)



