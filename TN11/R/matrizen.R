

# Matrizen

# Spaltenweise befüllen

A <- matrix(c(1,2,3,4), nrow = 2, ncol = 2)
A


# Zeilenweise befüllen
A <- matrix(c(1,2,3,4), nrow = 2, ncol = 2, byrow = TRUE)
A



A <- matrix(1:25, nrow = 5, ncol = 5, byrow = TRUE)
A


# Zugriffe 

A[1,2] # Element in Zeile 1, Spalte 2
A[1,]  # ganze erste zeile
A[,2]  # ganze zweite Spalte


# Untermatrizen
A[1:3,1:3] # Matrix die aus ersten drei Zeilen und ersten drei Spalten besteht
A[1:3,]   

A[c(1,3,5),] # alle ungeraden Zeilen


# Matrizenmultiplikation

B <- matrix(1:12, nrow = 3, ncol =4)
C <- matrix(1:20, nrow = 4, ncol =5)
dim(B) # Dimension der Matrix (nrow, ncol)
dim(C)

# Anzahl der Spalten von B = Anzahl der Zeilen von C

D <- B %*% C

dim(D)


B*B # elemtenweise Multiplikation


# transponieren (Zeilen in Spalten Vertauschen)
B
t(B)



# Größere Matrix, mit Zufallszahlen
# rnorm -> Normalverteilung (0,1) (Erwartungswert 0, Standardabweichung 1)



A <- matrix(rnorm(2000*2000), nrow = 2000, ncol = 2000)
A_

# Inverse = A_*A = A*A_ = I
# I.... Einheitsmatrix (Matrix mit Einsen in der Hauptdiagonale)

A_ <- solve(A)
A_

# Überprüfung

I_check <- A %*% A_
I <- diag(2000) # Diagonalmatrix 

max_abs_fehler <- max(abs(I_check - I)) # maximale Abweichung
max_abs_fehler # dast Null, also richtig





