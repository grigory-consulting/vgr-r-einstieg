# install.packages("tidyverse")

library(tidyverse)

daten <- read_csv("data/lieferung_2024q4.csv")

head(daten) # die ersten 6 Zeilen
head(daten, 2) # die ersten 2 Zeilen

glimpse(daten)

# Zugriff auf eine einzelne Spalte

daten$jahr

q4_2024 <- daten %>%
  filter(jahr == 2024, quartal == 4)

q4_2024

zeitraum <- daten %>%
  filter(between(jahr, 2022, 2024))
zeitraum

gefiltert <- daten %>%
       filter(between(wert,36000, 145000), quartal %in% c(3,4))


# mutate
# Ziel: eine neue Spalte hinzufügen
# Anteil jedes Bereichs an der Quartalgesamtsumme
# z. B. Q12022 -> / Q22024 -> andere Gruppe

anteile <- daten %>%
  group_by(jahr,quartal) %>% # Gruppierung
  mutate(anteil = wert/sum(wert)) %>% # Summe auf die Gruppe anwenden
  ungroup()

anteile


# neue Spalte: Abweichung vom Quartalsmittel

abweichung <- daten %>%
  group_by(jahr,quartal) %>%
  mutate(abweichung = wert - mean(wert))%>%
  ungroup()



















