library(tidyverse)

daten <- read.csv("data/lieferung_2024q4.csv")
head(daten, 2)

glimpse(daten) 
daten$jahr

# Filtern: filter()
# z.B. alle Zeilen aus Jahr 2024 und Q4

q4_2024 <- daten |> filter(jahr == 2024, quartal == 4)
q4_2024

# between() als Kurzform für => und <=
zeitraum <- daten |>
  filter(between(jahr, 2022, 2024))
zeitraum

# Neue Kennzahlen mit mutate() ausrechnen
# Anteil jedes Bereichs an der Quartalsgesamtsumme
# q12022 -> eine Gruppe
# q22024 -> andere Gruppe

anteile <- daten |>
  group_by(jahr, quartal) |>
  mutate(anteil = wert / sum(wert))

# zählen
zeilen_pro_jahr <- daten |> count(jahr)
bereiche <- daten |> distinct(bereich_code)
bereiche

# summarise Aggregation mit group_by()
# Jahressumme
summe_pro_jahr <- daten |>
  group_by(jahr) |>
  summarise(jahr_summe = sum(wert), .grous = "drop")
summe_pro_jahr

# Mittelwert pro Bereich
summe_pro_jahr <- daten |>
  group_by(bereich_code, bereich_name) |>
  summarise(mittelwert = mean(wert), .grous = "drop")
summe_pro_jahr

# arrange... sortieren
# lag() vorhergehenden wert nehmen




