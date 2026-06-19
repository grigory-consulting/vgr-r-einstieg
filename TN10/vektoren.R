# vektoren

numbers <- c(1,3,4,5,6,443,9)


numbers

numbers <- c(1,3,4,5,6,443,"9")
numbers <- c(1,3,4,5,6,443,9)


logicals <- c(TRUE, FALSE, TRUE)
logicals2 <- c(TRUE, FALSE, 1)

seq_vec <- 1:1000 # Vektor von 1 bis 10000

rep.vec <- rep(10,4) # vektor mit 10 10 10 10
rep.vec

empty.vec <- numeric(70) # vbektor mit sibzig nullen
empty.vec

# Bennante Vektoren
einkommen <- c("Anna"<- 45000, "Bert"<- 60000,"Clara"<-800000)

# einkommen [["Clara"]]


numbers <- 1:9
numbers <- numbers*10+120
numbers

length(numbers)




# Zugriffe

numbers[2]

numbers[-2]

numbers[-1:-3]


# Logisches Zugreifen, Bedigung

mask <- (numbers !=130) # ungleich als 130
mask

mask <- (numbers <130) 
mask


numbers[mask] # alle Nummer die die Maske erfühlen
numbers[!mask] # alle Nummer die die Maske nicht erfühlen

#Modifikation

numbers[3] <- 99 # Dritte Zahl durch 99 ersetzen
numbers


# neu Ellemente hinzufügen
numbers[length(numbers)+1] <- 999
numbers

#kombination, zwei Vektoren verbinden
numbers_neu <- c(numbers,empty.vec)
numbers_neu

# vek.operationen
v1 <- c(1,2,3)
v2 <- c(34,43,11)

v1+v2
v1*v2 #elementare multiplikation
v1%*%v2 #matrix multiplication v1 transportiert mal v2

sum(v2)
mean(v2)
sort(v2)


