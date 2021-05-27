#Configuraciones Iniciales
rm(list = ls())
setwd("C:/Users/Jose/Documents/GitHub/Machine_Learning")
dir.create('./Clase1_R')
setwd("./Clase1_R/")
getwd()
dir()

sessionInfo()

#### Datos de clase(tipo): SERIES DE TIEMPO ####
#AirPassenger
class(AirPassengers)
?AirPassengers

#Graficos basicos
plot(AirPassengers,ylab='Total (Mensual)',
     main='Numero de pasajeros')
grid(nx = NA, ny = 6, col = 'blue', lty = 4, lwd = 0.5)
#ayuda de la funcion grid
?grid

# data sobre un problema clasico de la teoria de la probabilidad
#install.packages("astsa")
library(astsa)
library(help=astsa)
data(list='birth',package = 'astsa')#cargamos el dataset 'birth del paquete 'astsa'
class(birth)
plot(birth, ylab='Nacimientos',main='Nacimientos mensuales en USA')
birth

# Funciones basicas para objetos de tipo ts
help(lh)
lh

# Otro DataSet
#install.packages('MASS')
library('MASS')
data(list='deaths',package = 'MASS')
deaths
?deaths

# Funcion tsp -> salida: (inicio, end, frecuencia)
tsp(deaths)
# Funciones mas abstractas 
start(deaths) # inicia en enero de 1974
end(deaths)   # termina en diciembre de 1979
frequency(deaths) # resolucion mensual








