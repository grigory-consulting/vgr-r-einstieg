library(tidyverse)

daten <- read_csv("data/lieferung_2024q4.csv")


head(daten, 2)

glimpse(daten)

#Zugriff auf eine einzelne Spalte:

daten$jahr


#Filtern ----
#z.B. alle Zahlen aus dem Jahr 2024 un Q4

q4_2024 <- daten |> filter(jahr == 2024, quartal == 4)


#between() als Kurzform für => udn <=

Zeitraum <- daten|>
  filter(between(jahr, 2022, 2024))

#Alle Zeilen aus Q3 und Q4 und Wert zwischen 36000 und 145000

zeitraum2 <- daten |>
  filter(between(quartal, 3, 4), between(wert, 36000, 145000)) 


#Neue Kennzahlen mit mutate() auszurechnen
#Ziel ist eine neue Spalte hinzuzufügen
#Anteil jedes Bereichs an der Quartalsgesamtsumme
# z. B. Q12022 -> eine Gruppe / Q22024 -> andere Gruppe


anteile <- daten |>
  group_by(jahr, quartal) |> #Gruppierung 
  mutate(anteil = wert / sum(wert)) |> #Spalten hinzufügen
         ungroup() 

#Frage von Manu:
gruppen <- daten |> group_by(jahr, quartal) |> mutate(info = list(cur_group()))



# Neue Spalte Abweichung vom  Quartalsmittel

abweichung <- daten |>
  group_by(jahr, quartal) |>
  mutate(abweichung = wert - mean(wert)) |>
  ungroup()

#Zählen

zeilen_pro_jahr <- daten |> count(jahr)

bereiche <- daten |> distinct(bereich_code)
bereiche


# Aggregation mit group_by() und summarise()
#z.B. Jahressumme

summe_pro_jahr <- daten |>
  group_by(jahr) |>
  summarise(jahr_summe = sum(wert), .groups = "drop") #groups = drop löst die Gruppierung auf


#Aufgabe: Mittelwert pro Bereich

mittelwert <- daten |>
  group_by(bereich_code, bereich_name)|>
  summarise(mittelwert = mean(wert), .groups = "drop")
 
# arrange - sortieren 
# lag() - vorhergehenden  Wert nehmen (hier ist das sortieren sehr wichtig!!)


daten_neu <- daten |> 
  group_by(bereich_code) |>
  arrange(jahr, quartal) |>
  mutate(jahr_vergleich = wert - lag(wert, n =4)) |>
  ungroup() |>
  filter(!is.na(jahr_vergleich))  #Das Ausrufezeichen bedeutet, keine Zeilen mit NA anzeigen 

daten_neu$jahr_vergleich

# gleitender Durchschnitt (3Perioden)
#Durchschnitt der letzten 3 Quartale

daten2 <-daten |>
  group_by(bereich_code) |>
  arrange(jahr, quartal) |>
  mutate(durchschnitt = (wert + lag(wert, n=1) + lag(wert, n=2))/3) |>
  ungroup() |>
  filter(!is.na(durchschnitt))
  





