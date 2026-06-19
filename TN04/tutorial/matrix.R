#Matritzen


#Spaltenweise befüllen

A <- matrix(c(1,2,3,4), nrow = 2, ncol = 2)
A

#Zeilenweise befüllen
A <- matrix(c(1,2,3,4), nrow = 2, ncol = 2, byrow = TRUE)
A


A <- matrix(1:25, nrow = 5, ncol = 5, byrow = TRUE)
A


#Zugriffe

A[1,2] #Element in Zeile 1, Spalte 2
A[1,] #ganze erste Zeile
A[,4] # ganze vierte Spalte

A[1:3,1:3] #Ertse drei Zeilen und erste drei Spalten
A[1:3, ] #Erste drei Zeilen und alle Spalten

A[c(1,3,5), ] # Ausgewählte Zeilen

#Matritzenmultiplikation ----

B <- matrix(1:12, nrow =3, ncol = 4)
C <- matrix(1:20, nrow = 4, ncol = 5)


dim(B)
dim(C)

D <- B %*% C

dim(D)

#Transonieren von Matritzen (Zeilen und Spalten vertauschen)
t(B)
t(C)


#Größere Matrix, wir befüllen mit Zufallszahlen
#rnorm -> Normalverteilung (0,1)

A <- matrix(rnorm(2000*2000), nrow = 2000, ncol = 2000)
A


dim(A) #Dimension von A

A[1:5,1:5] #linke obere Ecke

summary(as.vector(A))


A_ <- solve(A) 

A_


I_check <- A %*% A_ #Korrekt aber nicht nachprüfbar

I <- diag(2000) #100 mal 100 mit Einheitsmatrix

max_abs_fehler <- max(abs(I_check - I))

max_abs_fehler

#Ax = b ----

A <- matrix(rnorm(2000*2000), nrow = 2000, ncol = 2000, byrow = TRUE)
b <- rnorm(2000)
x <- solve(A,b)

max_abs_fehler <- max(abs(A %*% x - b))

max_abs_fehler







