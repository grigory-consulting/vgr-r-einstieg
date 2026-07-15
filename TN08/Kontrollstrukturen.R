x <-  21
if (x < 20){
  print("x ist kleiner 20")
}else if (x < 30){
  print("x ist kleiner 30 aber größer gleich 20")
}

vals <- c(5,25,15,30)
res <- ifelse(vals<20, "klein", "groß")

for (i in 1:5)
  print(i)

v <- c("Anna", "Bert", "Clara")
for (name in v)
  print(name)

A <-  matrix(1:25, nrow = 5, ncol = 5, byrow = TRUE)
A[2,]
A[,2]
A[c(1,3,5),]

B <-  matrix(1:12, nrow = 3, ncol = 4)
B
C <-  matrix(1:20, nrow = 4, ncol = 5)
C
dim(B)
dim(C)
D <-  B %*% C
dim(D)

A <-  matrix(rnorm(8*8), nrow = 8, ncol = 8)
A

