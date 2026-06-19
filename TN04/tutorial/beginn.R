##Erste Versuche ----

#Häckchen bei "Source on Save" bedeutet, 
#wenn ich Strg + S drücke wird gespeichert und zeitgleich ausgeführt.

x <- 10

mein_var <- 5

mein.var <- 8

.versteckt <- 7

#Ausdrücke

z <- x + mein.var
z <- x + mein.var+10

z <- z + 1 #increment

# löschen von Objekten

rm("mein.var")


#Konstanten (nur per Namenskonvention)
PI <- 3.14

#Datentypen

num <- 7 #nummerisch, douple ... Fließkommazahl in der doppelten genauigkeit (7,0)

int_num <- 7L #Ganzzahl/Integer (nur die 7 ohne Komma)

name <- "DESTATIS" #character


#logical
flag1 <- TRUE #Flag sind immer Bedingungen, also entweder "TRUE" oder "FALSE"
flag2 <- FALSE

#Datentyp konvertierungen

print(as.character(num)) #an dieser Stelle definieren wir die 7 als Text

print(as.numeric("42")) #Einlesen von Text und in Zahl konvertieren

print(as.logical(0)) #Null ist immer FALSE, weil es allgemein nicht als Zahl definiert ist
print(as.logical(17)) #Alles, was keine Null ist, ist TRUE


























