# Character-Methoden (Strings)

# Überblick über die wichtigsten Funktionen

name <- "    Anna Meier    "

class(name)

nchar(name) # Anzahl der Zeichen (inkl. Leerzeichen)
name_trim <- trimws(name) # Löschung der führenden Leerzeichen
name_trim

toupper (name_trim) # alles groß
tolower (name_trim)

# Gleichheitsprüfung

"Anna" == "anna" # ungleich
tolower("Anna") == tolower("anna") # normalisieren

# paste... zusammenfügen, Trenner ... Leerzeichen

cities <- c("Berlin", "Bonn", "München", "Bremen")

"Bonn" %in% cities # Ist der Wert irgendwo enthalten
cities %in% c("Bonn", "Berlin", "Wiesbaden")

substr("Statistik", 1,4) # Teilstring, Substring: Zeichen von 1 bis 4

# übung 1
# Bereinigen Sie den Vektor: Leerzeichen am Rande weg und alles klein
namen <- c("   Anna", "BERT", "  clara ", "Dora  ")
tolower(trimws(namen))

# Kontrollstrukturen

#if, else, if, els

x <- 20
if (x<20){
  print("x ist kleiner als 20")
} else if (x < 30) {
  print("x ist kleiner 30 aber größer gleich 20")
} else if (x < 40){
  print("ist kleiner 40 aber größer gleich 30")
}





  