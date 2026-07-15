# install.packages("xlsx")
# install.packages("openxlsx")

library(readxl)
library (tidyverse)
library(openxlsx)



# Ordner erstellen

dir.create("output", showWarnings = FALSE)

xl_pfad <- "data/lieferung_excel.xlsx"
excel_sheets(xl_pfad) # Tabellenblätter

daten <- read_excel(xl_pfad, sheet = "Daten", skip =3)
daten


# wide/breit
# nach long konvertieren

daten_lang <- daten %>%
  pivot_longer(
    cols = -c(bereich_code, bereich_name),
    names_to = "zeit",
    values_to = "wert"
  )

# 20xxqy zu jahr = 20xx und quartal =y

# character methoden

daten <- daten_lang %>%
  mutate(
    jahr = as.integer(str_sub(zeit, 1, 4)), # die ersten 4 Zeichen
    quartal = as.integer(str_sub(zeit, 6,6)) # das letzte Zeichen
  ) %>%
    select(jahr, quartal, bereich_code, bereich_name, wert) %>% # Spalten, die behalten wollen
  arrange(jahr, quartal, bereich_code)
  

# Summe je Bereich über alle Q 2024

summe_bereich <- daten %>%
  filter(jahr == 2024) %>%
  group_by(bereich_code, bereich_name) %>%
  summarise(summe_2024 = sum(wert)) %>% # neuer Datensatz und kleiner
  arrange(desc(summe_2024))

wb <- createWorkbook() # leere Excel
addWorksheet(wb, "summe_2024")
writeData(wb, "summe_2024", summe_bereich)


kopf <- createStyle(textDecoration = "bold", fgFill = "#21303f",
                    fontColour = "#ffffff"
)
# Style hinzufügen 
addStyle(wb, "summe_2024", kopf, rows = 1, cols = seq_along(summe_bereich))

# Breite der Zellen anpassen

setColWidths(wb, "summe_2024", cols = seq_along(summe_bereich), widths = 20 )

saveWorkbook(wb, "output/ergebnis_summe_2024.xlsx", overwrite = TRUE)












