
# Kontrollstrukturen


x <- 40


if(x<20) {
  print("x ist kleiner als 20")
}


if(x<20) {
  print("x ist kleiner als 20")
} else if (x<30) {
  print("x ist kleiner als 30, aber größer als 20")
} else {
  print("x ist größer/gleich 30")
}



values <- c(5, 25, 15, 30)

res <- ifelse(values<20, "klein", "groß")







