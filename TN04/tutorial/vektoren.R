#Wir arbeiten mit sogenannten Containern

#Vektoren

numbers <- c(1,2,3,4,5,6,443,9) # Das c steht für concatenate (zusammenführen)
#Die Werte in einem Vector sollten bestenfalls die gleiche Beschaffenheit haben.
#Falls es nicht die gleiche Beschaffenheit hat, könnte die automatische Typumwandlung = Coercion greifen, muss aber nicht. 


logicals <- c(TRUE, FALSE, TRUE)

logicals2 <- c(TRUE, FALSE, 1) #Coercion greift wieder ein

seq_vec <- 1:1000 #Vektor mit Einträgen von 1 bis 1000


rep_vec <- rep(10,4) #Wiederhole 4 mal die 10

empty_vec <- numeric(70) #leerer Vektor, der 70 mal die 0 wiederholt


##Benannte Vektoren ----

#werden auch named vectors genannt
#Schlüssel-Wert Paare

einkommen <- c("Anna" = 45000, "Bert" = 60000, "Clara" = 80000)

einkommen["Clara"]   #Zugriff auf ein Schlüsselwert Paar
einkommen[["Clara"]] #Zugriff auf Wert vom Schlüssel Clara'


numbers <- 1:9

numbers <- numbers*10 + 120

numbers


length(numbers) #Anzahl der Elemente/Länge des Vektor

#Zugriffe ----

numbers[2] #Zugriff auf das zweite Element

numbers[c(1,5)] #Zugriff auf das erste und fünfte Element


# Negative Zugriff, wenn ich mir etwas NICHT ansehen möchte

numbers[-2] #bedeutet, alles ansehen außer das zweite
numbers[-1:-3] #die ersten 3 werden raus gelassen


#logisches Zugreifen (Filtern) ----

mask <- (numbers != 130) #ungleich
mask

numbers [mask] #Alle Elemente, die die Maske erfüllen
numbers [!mask] # Alle Elemente, die die Maske nicht erfüllen


#Modifikation ----

numbers[3] <- 99 #Das dritte Element auf 99 setzen
numbers


#Neue Elemente ans Ende anhängen 

numbers[length(numbers)+1] <-999
numbers

# Kombinationen

numbers_neu <- c(numbers, empty_vec) #Kombination aus 2 Vektoren
numbers_neu



# Vektoriellen Operationen und Funktionen ----

v1 <- c(1,2,3)
v2 <- c(34,43,11)

v1+v2 #Elementenweise Addition
v1*v2 #Elementenweise Multiplikation

v1 %*% v2 # im Sinne der Matritzenmultiplikation

sum(v2) # Summe
mean(v2) #Durchschnitt
sort(v2) #sortieren





