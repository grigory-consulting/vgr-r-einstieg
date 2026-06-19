library(readxl)
#install.packages("openxlsx")
library(openxlsx)


#Ordner erstellen

dir.create("output", showWarnings = FALSE)


xl_pfad <- "data/lieferung_excel.xlsx"
excel_sheets(xl_pfad)


daten <- read_excel(xl_pfad, sheet = "Daten", skip =3)
daten


#wide zu long konvertieren

daten_long <- daten |>
  pivot_longer(
    cols = -c(bereich_code, bereich_name), #Wir transformieren alle Zeit und Wert Spalten, lassen aber code und name da
  names_to = "zeit",
  values_to = "wert") |>


#20xxqy zu jahr = 20xx und quartal = y

mutate(
  jahr = as.integer(str_sub(zeit,1,4)), #die ersten 4 Zeichen verwenden für das Jahr
  quartal = as.integer(str_sub(zeit,6,6)) #Das letzte Zeichen als Quartal
  ) |>
  select(jahr, quartal, bereich_code, bereich_name, wert) |> #Spalten, die ich behalten möchte
  arrange(jahr, quartal, bereich_code) #Sortierung von den genannten Spalten an die ersten Stellen


#Summe je Bereich über alle Quartale 2024

summe_bereich <- daten_long |>
  filter(jahr == 2024) |>
  group_by(bereich_code, bereich_name) |>
  summarise(summe_2024 = sum(wert)) |>
  arrange(desc(summe_2024)) #desc steht für absteigend


#writexlsx als Einzeiler
write.xlsx(summe_bereich, "output/ergebnis_summe_2024.xlsx")
#An dieser Stelle könnte ich nun overwrite = TRUE schreiben, wenn ich möchte, dass das vorherige Ergebnis überschrieben wird.
#Oder ich schreibe overwrite = FALSE, dann bricht er ab. Dann müsste ich ggf. den Outputnamen anpassen
#write.xlsx(summe_bereich, "output/ergebnis_summe_2024.xlsx", overwrite = TRUE)


#openxlsx

wb <- createWorkbook() #wb ist wie leere Exceldatei
addWorksheet(wb, "summe_2024") #neues Blatt hinzufügen
writeData(wb, "summe_2024", summe_bereich)
kopf <- createStyle(textDecoration = "bold", fgFill = "#21303f",
                    fontColour = "#ffffff"
                    )

#Style hinzufügen
addStyle(wb, "summe_2024", kopf, rows = 1, cols = seq_along(summe_bereich))

#Breite der Zellen anpassen
setColWidths(wb, "summe_2024", cols = seq_along(summe_bereich), widths = "auto")
saveWorkbook(wb, "output/ergebnis_summe_2024_formatiert.xlsx")








