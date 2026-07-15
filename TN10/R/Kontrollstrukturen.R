
# Kontrollstrukturen

# if, else if, else

x <- 20

if (x<20){
  print("x ist kleiner 20")
}else if (x<30){
  print ("x ist kleiner 30 aber größer gleich 20")
}else if (x < 40) {
    print ("x ist kleiner 40 aber größer gleich 30")
  }

# if else vektorisiert

vals <- c(5,25,15,30)
res <- ifelse(vals<20, "klein", "groß")
res

# for-schleife

for(i in 1:5){ # 5 malige WH
  print(i)
  print(i*i)
}


v <- c("Anna", "Bert", "Clara")

for (name in v){
  print(name)
}
  


















































































