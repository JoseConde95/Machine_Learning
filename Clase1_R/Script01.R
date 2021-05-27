#Configuraciones Iniciales
setwd("C:/Users/Jose/Documents/GitHub/Machine_Learning")
dir.create('./Clase1_R')
setwd("./Clase1_R/")
getwd()
dir()
rm(list = ls())

# Analisis de datos exploratorios (EDA en ingles)
# Inspeccionar y explorar los datos antes de una hipotesis, o ajustar un predictor, objetivo diferencial mas ambicioso
# Visualizacion o graficos, ver la informacion graficamente
# interpretar, calcular, de manera resumida
# analisis univariado, bivariado y multivariado
# tipo de variable. categorica o continua

# TIPO DE DATOS: ####

# Datos Categoricos univariados ####

# Simular algunos datos categoricos: R se le conoce como "datos de tipo factor"
gender<-c(rep('Boy',10),rep('Girl',12))
drink<-c(rep('Coke',5),rep('Sprite',3),rep('Coffee',6),rep('Tea',7),rep('Water',1))
age<-sample(c('Young','Old'),size = length(gender),replace = T)

# Chocolateando los elementos
n = length(gender)
gender<-gender[sample(x = 1:n,size = n)]
drink<-drink[sample(x = 1:n,size = n)]
age<-age[sample(x = 1:n,size = n)]


# Si yo tengo variables categoricas, lo primero que debo conocer son las frecuencias
# Si una variable es cadena de caracter,se puede mantener como cadena de carecter o se puede pasar a tipo factor.

# Contar frecuencias de cada nivel de las variables anteriores.
table(gender);table(drink);table(age)

# En lugar de contar las frecuencias en cada nivel (de cada variable categorica), calculo las proporciones:
# Usamos: prop.table
prop.table(table(gender));prop.table(table(drink));prop.table(table(age))

# En resumen, con esto se sabe cual es la distribucion Univariada de las variables categoricas (para R son var. cadenas de caracter) 


# Datos Categoricos bivariados ####
# paquete: magrittr
library(magrittr)
library(help=magrittr)
#
cbind(gender,drink)%>%head #cbind(gender,drink) -> salida va a ser el argumento de head(argumento/salida)
#
table1 <- table(gender,drink);table1.1 <- round(100*prop.table(table(gender,drink)),digits = 2)
table1;table1.1


# Datos categoricos Multivariados

table2_1<-table(gender,drink,age) 
table2_1

# Maneta mas legible
table2_2<-ftable(gender,drink,age)
table2_2

# Ante la duda como, saber que argumentos debe tener una funcion, que tipo de argumento es una funcion 
# o cual es la salida de una funcion , acceder a la ayuda "help()" o "help.search()"
help("ftable")
help.search("array") #filtra en toda la informacion de instalada en R, que tenga la palabra "array"



##### Datos Continuos ####

# Generando un vector con elementos pseudo - aleatorios
x <- c(rexp(n = 20),runif(n = 80,min = 0,max = 20),rnorm(n = 50,mean = 9,sd = 6.5),rweibull(n = 20,shape = 5))
length(x)
# Desordenar los elementos de x
x<-x[sample(x = 1:length(x),length(x))]
plot(x)
# Medidas de posicion
m1<-mean(x)
m2<-median(x)
# Medidas de escala
desEst<-sd(x) # volatilidad
RangoInter<-IQR(x) # Que tan centrada esta mi data
m1;m2;desEst;RangoInter

# Coeficiente de Asimetria de Yule


#### Visualizacion ####
# Datos categoricos: gender, drink
#Univariado
barplot(table(age))
#Bivariado
x11();plot(table1, main='Grafico Bivariado')
x11();plot(table2_1, main='Grafico Bivariado')

# Datos Continuos: 
sample1<-rexp(n = 100)
x11();stripchart(x = sample1) # Para ver donde esta concentrada la data

x11();hist(x = sample1,freq = T, main = 'Frecuencias')
x11();hist(x = sample1,freq = F, main = 'Proporciones') #densidad

h1<-hist(sample1)
h1$breaks # Para saber cuales son los histogramas de clase, los limites de c/u de los intervalos de clase
h1$counts # Altura de cada una de las brras del grafico de histograma
h1$density# los kernel

# Colocando la curva de densidad sobre el histograma
hist(sample1,freq = F,main = 'Densidad')
lines(density(sample1))
rug(sample1)

# Teorema del Limite Central
sample2<-rnorm(n = 10^5)
hist(sample2,freq = F,main = 'ProporcionDensidad')
lines(density(sample2))
rug(sample2)

# Ejecutemos varias veces rnorm y veamos el comportamiento de su boxplot
for (num in 1:100) {#Hacer 100 veces una tarea
  #x<-rnorm(100)
  x <- c(rexp(n = 20),runif(n = 80,min = 0,max = 20),rnorm(n = 50,mean = 9,sd = 6.5),rweibull(n = 20,shape = 5))
  x <- x[sample(1:length(x),length(x))]
  boxplot(x) # la tarea es generar el vector con los valores con distribuciones y generar su grafico de caja
  Sys.sleep(0.05) #obligar que el sistema haga una pausa entre graficas de 0.05 seg
}






