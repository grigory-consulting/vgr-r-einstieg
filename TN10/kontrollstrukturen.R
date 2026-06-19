# Kontrollstrukturen
# if, else if, else

x <- 21
if(x>20){
  print ("x ist größer 20")
}else if (x<30){ #weiter bedigung
  print ("zwischen 20 und 30")
}else {# wenn die weiter bedigung nicht erfühlt ist
  print ("größer als 30")}

# ifelse if else vektorisiert

vals <- c(5,15,25,30)
res <- ifelse(vals<20,"klein","groß")
res

# schleifen mit index
for (i in 1:5){
  print(i)
  print(i*i)
}

#schleife ohne index

v <- c("anna","bert","clara")
for (name in v){print(name)}

# 
