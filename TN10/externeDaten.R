

library(readxl) #
#install.packages("openxlsx")
library(openxlsx)

#Ordner
dir.create("output",showWarnings=FALSE)


xl_pfad <- "data/lieferung_excel.xlsx"
  excel_sheets(xl_pfad)
  
daten <- read_excel(xl_pfad,sheet=2,skip=3) # daten aus dem Excel eingelesen, zweiten Datenblatt, ab 4.zeile (erste 3 überspringen)
daten


meta <- read_excel(xl_pfad,sheet="Metadaten",col_names=FALSE)#col_names=FALSE heißt es die erste Spalte wird nicht zu Spaltenname konvertieren


#wide <- long aufbereiten (transformieren)

daten_long <- daten |> 
  pivot_longer(
    cols=-c(bereich_code,bereich_name), # alle zeit- und wertspalten, aber nicht WB
    names_to="zeit",
    values_to="wert"
  ) |> 


#20xxqx" <-  jahr=20xx und quartal=y zerlegen
mutate(
  jahr=as.integer(str_sub(zeit,1,4)), # die ersten vier zeichnen für jahr benutzen
  quartal = as.integer(str_sub(zeit,6))
) |> 
  select(jahr,quartal,bereich_code,bereich_name,wert) |> 
  arrange(jahr,quartal,bereich_code)
          
#summe je bereich über alle quartale 2024
#daten24 <- daten_long |> 
 #select(jahr==2024, bereich_code) |> # das kann man nicht, weil es nur daten mit Jahr 2024 behält und nicht die weiter angaben beinhlatet bei den Daten_long alles in einer Spalte ist, die funktion Select kann mann nur im Format Wide arbeiten.
  #group_by(bereich_code,bereich_name) |> 
  #summarise(summe_ich=sum(wert))
#daten24

res <- daten_long |> 
  filter(jahr==2024) |> 
  group_by(bereich_code,bereich_name) |> 
  summarise(summe_2024=sum(wert),.groups="drop") |> #.groups="drop" hat die gleiche funktion wie ungroup, wenn man mit den Daten weiter arbeiten möchte, dann sind sie nicht mehr gruppiert
              arrange(desc(summe_2024))
res

#write.xlsx
write.xlsx(res,"output/ergebnis_summe_2024.xlsx",overwrite=TRUE) # ergebnis in excel exportiert

#openxlsx
wb <- createWorkbook()#wb ist leere excelDatei
addWorksheet(wb,"summe_2024") #neues blatt hinzufügen
writeData(wb,"summe_2024",res)
kopf <- createStyle(textDecoration = "bold") # eingeschaften der Zelle, Buchstaben...
addStyle(wb,"summe_2024",kopf,rows=1,cols=seq_along(res)) # style zufügen der Tabelle
setColWidths(wb,"summe_2024",cols=seq_along(res),widths="auto") #breite der zelle anpassen
saveWorkbook(wb,"output/ergebnis_summe_2024_formatiert.xlsx",overwrite=TRUE)


# PIPE sind ein Teil der library, create worksheet gehört nicht dazu, deswegen funktionieren die PIPES an dieser stelle nicht






