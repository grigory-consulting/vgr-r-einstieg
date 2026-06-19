library(tidyverse)

daten <- read_csv("data/lieferung_2024q4.csv")

head(daten)

glimpse(daten)
# Zugriff auf eine Spalte
daten$jahr

# Filtern: filter()
#z.B. alle Zeilen aus Jahr 2024

q4_2024 <- daten |> 
  filter(jahr ==2024, quartal == 4)
q4_2024

# between() als Kurzform für => und <=
zeitraum <- daten |>
  filter(between(jahr, 2022, 2024))
zeitraum

# Alle Zeilen aus Q3 und Q4 und Wert zwischen 36000 und 145000

auswahl <- daten |>
  filter(quartal >= 3) |>
  filter(between(wert, 36000, 145000))
auswahl

# Neue Kennzahlen mit mutate() auszurechnen
# Anteil jedes Bereichs an der Quartalsgesamtsumme
# Q12022 -> eine Gruppe
# Q22024 -> andere Gruppe

anteile <- daten |>
  group_by(jahr, quartal)|> #Gruppierung
  mutate(anteil = wert /sum(wert)) |> # Spalten hinzufügen
  ungroup()

#Neue Spalte: Abweichung vom Quartalsmittel

abw_mw <- daten |>
  group_by(jahr, quartal)|> #Gruppierung
  mutate(abweichung = wert - mean(wert)) |> 
  ungroup()

# Zählen
zeilen_pro_jahr <- daten |> count(jahr)
bereiche <- daten |> distinct(bereich_code)
bereiche

# Aggregation mit group_by() summarise
#Jahressummen

summe_pro_jahr <- daten |>
  group_by(jahr) |>
  summarise(jahr_summe = sum(wert), .groups = "drop")

#Mittelwert pro Bereich
mittelwert_pro_bereich <- daten |>
  group_by(bereich_code) |>
  summarise(mittelwert_bereich = mean(wert), .groups ="drop")

#arrange ... sortieren
#lag() ... vorhergehenden Wert nehmen

daten_neu <- daten |>
  group_by(bereich_code) |>
  arrange(jahr, quartal) |>
  mutate(jahr_vergleich = wert - lag(wert, n=4)) |>
  ungroup() |>
  filter(!is.na(jahr_vergleich)) # keine Zeilen mit NA 
daten_neu$jahr_vergleich

# Berechnung gleitender Durchschnitt (3 Perioden)

daten_neu <- daten |>
  group_by(bereich_code) |>
  arrange(jahr, quartal) |>
  mutate(gl_durchschnitt = (wert + lag(wert,1) + lag(wert,2))/3) |>
  ungroup() |>
  filter(!is.na(gl_durchschnitt))
daten_neu$gl_durchschnitt
