

# Vektoren

numbers <- c(1,3,4,5,6,443,9) #concatenate = zusammenführen
numbers # Vektor aus numerical

numbers <- c(1,3,4,5,6,443,"9") # automatische Typenwandlung = Coercion
# numbers ist jetzt Vektor aus characaters

logicals <- c(TRUE, FALSE, TRUE)

logicals2 <- c(TRUE, FALSE, 1)

seq_vec <- 1:1000 # Vektor mit Einträge von 1 bis 1000
rep_vec <- rep(10,4) # Wiederhole 4 mal die 10
rep_vec
empty_vec <- numeric(70) # 70 mal die Null
empty_vec

#Benannte Vektoren (named Vectors)
#Schlüssel-Wert Paare
einkommen <- c("Anna" = 45000, "Bert" = 60000, "Clara" =80000 )
einkommen
einkommen["Clara"] # Zugriff auf ein Schlüsel-Wert Paar
einkommen[["Clara"]] # Zugriff auf Wert vom Schlüssel "Clara"

numbers <- 1:9
numbers <- numbers*10+120
numbers

length(numbers) #Anzahl der Elemente = Länge der Vektoren

#Zugriffe
numbers[2] #Zugriff aus das zweite Element
numbers[c(1,5)] # zugriff auf das erste und fünfte Element

#Negative Zugriff (R-Feature)

numbers[-2] # das zweite Element rauslassen
numbers[-1:-3] # die ersten 3 werden rausgelassen


# Logisches Zugreifen (Filter)
mask <- (numbers > 199) # !=ungleich
mask


numbers[mask] #alle Elemente, die die Maske erfüllen
numbers[!mask] #alle Elemente, die die Maske nicht erfüllen

# Modifikation

numbers[3] <- 99 #das dritte Element modifizieren
numbers


# Neue Elemente hinzufügen = Länge + 1 modifizieren

numbers[length(numbers) + 1] <- 999
numbers

# Kombination
numbers_neu <- c(numbers, empty_vec)
numbers_neu

# Vektoreillen Operationen/Funktionen
v1 <- c(1,2,3)
v2 <- c(34, 43, 11)

v1+v2 # elementenweise Addition
v1*v2 # elementenweise Multiplikation

v1 %*% v2 # im Sinne der Matrizenmultiplikation

sum(v2) #Summe
mean(v2) #Durchschnitt
sort(v2) #Sortieren


