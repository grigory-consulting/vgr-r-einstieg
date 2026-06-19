
# Spaltenweise Matrix

A <- matrix(c(1,2,3,4),nrow=2,ncol=2)
A


# Zeilenweisenweise Matrix

A <- matrix(c(1,2,3,4),nrow=2,ncol=2, byrow=TRUE)
A


A <- matrix(c(1:25),nrow=5,ncol=5, byrow=TRUE)
A


#zUGRIFFE

A[1,2] # Element in Zeile 1, Spalte 2
A[1,] # ganze erste zeile
A[,4] # ganze vierte spalte
A[1:3,1:3] #erste drei zeilen, erste drei spalten
A[c(1,3,5),] # die ausgewählte zeilen
B <- matrix(1:12,nrow=3,ncol=4)
C <- matrix(1:20,nrow=4,ncol=5)
B

dim(B)
D <- B %*% C # multiplication B * C
D

dim(D)
FF <- t(B) # Transporieren
FF


# Zufallsdaten
A <- matrix(rnorm(2000*2000),nrow=2000,ncol=2000)
A
A[1:5,1:5]
summary(as.vector(A)) # Eigenschaften der Matrix

A_ <- solve(A) # Inverse A
A_

I_check <- A %*% A_
I_check # ist nicht ganz einheitsmatrix deswegen lieber andere Kontrolle
I <- diag(2000) #diagonal matrix

max_abs_fehler <- max(abs(I_check - I))
max_abs_fehler # wenn diese Zahl klein ist, sehr sehr klein, dann ist die A- die Inverse Matrix zu A

# Ax=b
A <- matrix(rnorm(2000*2000),nrow=2000,ncol=2000, byrow_TRUE)
b <- rnorm(2000)
x <- solve(A,b)
x


                      