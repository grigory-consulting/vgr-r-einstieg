library(tidyverse)
daten <- read_csv("lieferung_2024q4.csv")
show_col_types = FALSE
q4_2024 <- daten |>
  filter(jahr==2024, quartal==4)
q4_2024

ausw2 <- daten |>
  filter(between(quartal,3,4)) |>
  filter(between(wert, 1400, 20000))
ausw2

mwpb <- daten |>
  group_by(bereich_code) |>
  summarize(mwpb=mean(wert), .groups = "drop")
mwpb

rma_data <- daten |>
  arrange(jahr, quartal) |>
  mutate(rma = (wert+lag(wert, n=1)+lag(wert, n=2))/3)
rma_data


library(readxl)
daten <- read_excel("lieferung_excel.xlsx", sheet = 2, skip = 3)
library(tidyr)

df_long <- daten %>%
  pivot_longer(
    cols = starts_with("Messung"), # Passen Sie dies an Ihre Spaltennamen an (oder nutzen Sie z.B. 2:5)
    names_to = "Messzeitpunkt",     # Name der neuen Spalte für die alten Spaltenüberschriften
    values_to = "Wert"              # Name der neuen Spalte für die Datenwerte
  )
head(df_long)

daten1 <- read_excel("regional.xlsx", sheet = 1)
daten2 <- read_excel("regional.xlsx", sheet = 2)
daten3 <- read_excel("regional.xlsx", sheet = 3)