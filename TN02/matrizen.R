

# spaltenweise befüllen
A <- matrix(c(1,2,3,4), nrow = 2, ncol = 2)
A

# zeilenweise befüllen
A <- matrix(c(1, 2, 3, 4), nrow = 2, ncol = 2, byrow = TRUE)
A

A <- matrix(1:25, nrow = 5, ncol = 5, byrow = TRUE)
A

# Zugriffe
A[1,2] # Element in Zeile 1, Spalte 2
A[1,] # ganze erste Zeile
A[,4] # ganze vierte Spalte
A[1:3, 1:3] # erste 3 Zeilen und erste drei Spalten
A[c(1, 3, 5), ] # die ausgewählten Zeilen


# Transponieren

# wir befüllen mit Zufallszahlen
# rnorm -> Normalverteilung (0, 1)
A <- matrix(rnorm(10000), nrow = 100, ncol = 100, byrow = TRUE)
A
dim(A) # Dimension zeigen
A[1:5, 1:5] # linke obere Ecke
summary(as.vector(A))


A_ <- solve(A)

I_check <- A %*% A_
I <- diag(100) # 100x100 mit Einheitsmatrix

max_abs_fehler <- max(abs(I_check - I))
max_abs_fehler



