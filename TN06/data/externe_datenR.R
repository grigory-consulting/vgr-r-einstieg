library(readxl)


# Ordner erstellen

dir.create("output", showWarnings = FALSE)


xl_pfad <- "data/lieferung_excel.xlsx"
excel_sheets(xl_pfad) # Tabellenblätter auslesen

daten <- read_excel(xl_pfad, sheet = "Daten", skip=3)
daten

# wide/breit
# wir müssen nach long/lang konvertieren

daten <- daten %>%
  pivot_longer(
    cols = -c(bereich_code), bereich_name),
    names_to ="zeit" ,
    values_to = "wert"
  )%>%

daten <- daten %>%
  mutate(
    jahr=as.integer (str_sub(zeit,1,4)) # die ersten vier Zeichen
    quartal=as.integer(str_sub(zeit,6,6)) # das letzte Zeichen
  ) %>%
select(jahr,quartal,bereich_code,bereich_name,wert) %>% # Spalten, die wir behalten
  arrange(jahr,quartal,bereich_code)

# Summe über alle Quartale

