# Vektoren

numbers <- c(1,3,4,5,6,443,9) # concatenate = zusammenführen
numbers

numbers <- c(1,3,4,5,6,443,"9") # automatische Typumwandlung = Coercion
# numbers ist jetzt Vektoraus characters

logicals <- c(TRUE, FALSE, TRUE)
logials2 <- c(TRUE, FALSE, 1) # Coercion greift wieder ein

seq_vec <- 1:1000 # Vektor mit Einträgen von 1 bis 1000
rep_vec <- rep(10, 4) # Wiederhole 4 mal die 10 
rep_vec
empty_vec <- numeric(70) # 70 mal die Null
empty_vec


#Bekannte Vektoren (normal vectors
# Schlüssel-Wert Paare

einkommen <- c("Anna" = 45000, "Bert" = 6000, "Clara" = 80000)
einkommen["Clara"] # Zugriff auf ein Schlüssel-Wert Paar
einkommen[["Clara"]] # Zugriff auf Wert vom Schlüssel "Clara"

numbers <- 1:9
numbers <- numbers*10 + 120
numbers

length(numbers) # Anzahl der Eemente = Länge der Vektoren


# Zugriffe

numbers[2]  # Zugriff auf das zweite Element
numbers[c(1,5)] # Zugriff auf das erste und fünfte Elemente

# Negativer Zugriff (R-Feature)
numbers [-2] # das zweite Element rauslassen
numbers[-1:-3] # die ersten drei werden rausgelassen

# Logisches Zugreifen (Filter)

mask <- (numbers != 199) # !=ungleich 
mask 


numbers[mask] # alle Elemente, die die Maske erfüllen
numbers[!mask] # alle Elemente, die die Maske NICHT erfüllen

# Modifikation

numbers[3] <- 99 # das dritte Element modifizieren
numbers

# Neue Elemente hinzufügen = Länge + 1 modifzieren


numbers[length(numbers) +1] <- 999

numbers


# Kombination 

numbers_neu <- c(numbers, empty_vec) # Kombination auf zwei Vektoren
numbers_neu

# Vektorielle Operationen/ Funktionen

v1 <- c(1,2,3)
v2 <- c(34,43,11)

v1+v2 #elementenweise Addition
v1*v2 #elementenweise Multiplikation

v1 %*% v2 # im Sinne der Matrizenmultiplikation v1.T mal v2

sum(v2) #Summe
mean(v2) #Durchschnitt
sort(v2) # Sortieren



