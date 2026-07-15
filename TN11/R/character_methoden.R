#Character-methoden (Strings)

# Überblick über die wichtigsten Funktionen

name <- "  Anna Meier "

class(name)

nchar(name) # Anzahl der Zeichen (inkl. Leerzeichen)
name_trim <- trimws(name) # Löschung der führenden Leerzeichen
name_trim
toupper(name_trim) # alles groß
tolower(name_trim)

# Gleichheitsprüfung

"Anna" == "anna" # ungleich
tolower("Anna") == tolower("anna") # normalisieren 

# paste ... zusammenführen, Trenner ... Leerzeichen
paste("Umsatz", 2026) # "Umsatz 2026"
paste("Umsatz", 2026, sep = "_") # "Umsatz_2026"
paste0("TN", 1:11) # ohne Trenner, vektorisiert
paste("Q", 1:4)

cities <- c("Berlin", "Bonn", "München", "Bremen")

# "Bonn" %in% cities # Ist der Wert irgendwo enthalten
cities %in% c("Bonn", "Berlin", "Wiesbaden")

substr("Statistik", 1, 4) #Teilstrink, Substring: Zeichen von 1 bis 4

# Übung 1
# Bereinigen Sie den Vektor: Leerzeichen am Rande weg und alles klein
namen <- c("   Anna",  "BERT",  " clara ", "Dora ")
namen_bereinigt <- tolower(trimws(namen))
namen_bereinigt

#Übung 2
# Erzeugen Sie aus den bereinigten Namen E-Mailadressen der Form
# "anna@destatis.de", "bert@destatis.de", "clara@destatis.de", "dora@destatis.de"

emails <- paste0(namen_bereinigt, "@destatis.de")
emails


# Substitution = Ersetzung
sub("n", "N", "Bananen") # ersetzt nur das ERSTE n
gsub("n", "N", "Bananen") # ersetzt ALLE n (g 0 global)

geld <- c("1.200,50", "980,00", "2.345,99")

geld_ohne_punkt <- gsub("\\.", "", geld) # Punkt ist Spezialcharacter für Ausdruck "ALLES"'
# \\ -> escaped
# Punkt wird wirklich als Punkt betrachtet

geld_sauber <- gsub(",", ".", geld_ohne_punkt)
var<- as.numeric(geld_sauber) # Konvertierung Text -> Zahl 

# geld_new <- as.numeric(geld)




