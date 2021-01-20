####BUENA PARTE DEL CÓDIGO USADO AQUÍ SIGUE A: http://eclr.humanities.manchester.ac.uk/index.php/R_GARCH

#install.packages(c("quantmod","rugarch","rmgarch"))   # only needed in case you have not yet installed these packages
library(quantmod)
library(rugarch)
library(rmgarch)

#Usaremos la data de getSymbols (del paquete quantmod), que nos sirve para obtener data.
#por defecto nos da la data de los stocks en Yahoo Finance.
startDate = as.Date("2015-01-03") #Specify period of time we are interested in
endDate = as.Date("2019-01-19")

##ENTONCES TRAIGAMOS LA DATA DE LAS ACCIONES DE ALGUNAS EMPRESAS
getSymbols("IBM", from = startDate, to = endDate)
getSymbols("GOOG", from = startDate, to = endDate)
getSymbols("BP", from = startDate, to = endDate)#
getSymbols("TSLA", from = startDate, to = endDate) 
getSymbols("BTC-USD", from = startDate, to = endDate)#

#head(TSLA)
tail(TSLA)
str(TSLA)  #Objeto tipo "xts": serie de tiempo
chartSeries(TSLA)



rTSLA <- dailyReturn(TSLA)
rBP <- dailyReturn(BP)
rGOOG <- dailyReturn(GOOG)
rBTC <- dailyReturn(`BTC-USD`)
str(rBTC)

#HAGAMOS UN DATA FRAME EXCEPTUANDO A BITCOIN(tiene más filas)
rX <- data.frame(rTSLA, rBP, rGOOG)
names(rX)[1] <- "rTSLA"
names(rX)[2] <- "rBP"
names(rX)[3] <- "rGOOG"
#names(rX)[3] <- "rBTC"
rX


###construyendo el modelo univariante
