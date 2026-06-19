

library(readxl) # 
# install.packages("openxlsx")
library(openxlsx)

# Ordner
dir.create("output", showWarnings = FALSE)

xl_pfad <- "lieferung_excel.xlsx"
excel_sheets(xl_pfad)

daten <- read_excel(xl_pfad, sheet = "Daten", skip = 3)

meta <- read_excel(xl_pfad, sheet = "Metadaten", col_names = FALSE)
# col_names = FALSE bedeutet, erste Zeile wird nicht zu SPaltennamen konvertiert


# wide -> long aufbereiten

daten_long <- daten |>
  pivot_longer(
    cols = -c(bereich_code, bereich_name), # alle wert- und zeitspalten
    names_to = "zeit",
    values_to = "wert"
  ) |>

# "20xxqy -> jahr=20xx und quartal=y zerlegen

mutate(
  jahr = as.integer(str_sub(zeit, 1, 4)),
  quartal = as.integer(str_sub(zeit, 6, 6))
)|>

  select(jahr, quartal, bereich_code, bereich_name, wert)|>
  arrange(jahr, quartal, bereich_name) 

# summe je bereich über alle quartale 2024

res <- daten_long |>
  filter(jahr == 2024) |>
  group_by(bereich_code, bereich_name) |>
  summarise(summe_2024 = sum(wert), .groups = "drop") |>
  arrange(desc(summe_2024)) # desc... absteigend sortieren
res

# write.xlsx als Einzeiler
write.xlsx(res, "output/ergebnis_summe_2024.xlsx", overwrite = TRUE)

# openxlsx
wb <- createWorkbook() # wb ist leere excel datei
addWorksheet(wb, "Summe_2024") # neues Blatt hinzufügen
writeData(wb, "Summe_2024", res)
kopf <- createStyle(textDecoration = "bold", fgFill = '#21303f',
                    fontColour = '#ffffff'
                    )
addStyle(wb, "Summe_2024", kopf, rows = 1, cols = seq_along(res))

# Style hinzufügen
addStyle(wb, "Summe_2024", kopf, rows = 1, cols = seq_along(res))
# Breite der Zellen anpassen (automatisch)
setColWidths(wb, "Summe_2024", cols = seq_along(res), widths = "auto")
saveWorkbook(wb, "output/erg_summe_2024_formatiert.xlsx")
