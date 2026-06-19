library(tidyverse)

daten <- read_csv("data/lieferung_2024q4.csv")
 

head(daten, 2) #daten zeigen


glimpse(daten) # daten zeigen

daten$jahr #zeigt alle daten in der spalte Jahre


#Filtern
#alle Zeilen aus Jahr 2024 und q4

q4_2024 <-daten |>
  filter(jahr==2024,quartal==4)
q4_2024
  

# between als Kurzform für Zeitraum
zeitraum <- daten |>
  filter(between(jahr,2022,2024))
zeitraum

# alle zeilen aus q3 und q4 und wert zwischen 36579 und 145411
filter1 <- daten |>
  filter(quartal==3 | quartal==4,between(wert,36579,145411))
filter1


#neue kennzahlen mit mutate ausrechnen
#anteil jedes bereich an der quartalsgesamtsumme
#ziel: neue Spalte zufügrn mit anteilen

anteile <- daten|>
  group_by(jahr,quartal)|> #erstellung der summen via jahre und quartale uber alle WB
  mutate(anteil=wert/sum(wert)) # spalte hinzufügung
anteile

gruppen <- daten|>group_by(jahr,quartal)|>mutate(info=list(cur_group()))

#abweichung von quartalsmitte, neue spalte erstellen
abweichung <- daten|>
  group_by(jahr,quartal)|>
  mutate(abweichung=wert-mean(wert))|>
  ungroup()
abweichung


#zählen
#ziel: zeilen pro jahr
zeilen_pro_jahr <- daten|>count(jahr)
bereiche <- daten |> distinct(bereich_code) # einzelne eindeutige bereiche

#aggregation mit group_by und summerrise
summe_pro_jahr <- daten|>
  group_by(jahr) |>
  summarise(jahr_summe=sum(wert),.groups="drop")
summe_pro_jahr

#mittelwert pro bereich
#aggregation mit group_by und summerrise
mittelwert_pro_bereich <- daten|>
  group_by(bereich_code,bereich_name) |>
  summarise(mittelwert=mean(wert),.groups="drop")
mittelwert_pro_bereich


#arrange ... sortieren
#lag() ... vorhergehenden wert nehmen
daten_neu <- daten|> group_by(bereich_code) |>
  arrange(jahr,quartal) |> #sortieren nach jahr/quartal aufsteigend
  mutate(jahr_vergleich=lag(wert,n=4))|>
  ungroup ()|>
  filter(!is.na(jahr_vergleich)) #keine zeilen mit NA'
daten_neu$jahr_vergleich

#gleitende durchschnitt (3 perioden)
daten_neu2 <- daten |>group_by(bereich_code) |>
  arrange(jahr,quartal)|>
  mutate(gl_durchschnitt=(wert+lag(wert,1)+lag(wert,2))/3)|>
  ungroup ()|>
  filter(!is.na(gl_durchschnitt)) #keine zeilen mit NA'
daten_neu2$gl_durchschnitt

# 
  
  


