datosEntrada <- read.csv("household_power_consumption.txt",stringsAsFactors=F, header=T, sep=';', na.strings="?",)

datosEntrada$Date <- as.Date(datosEntrada$Date, format="%d/%m/%Y")
datosRecortados <- subset(datosEntrada, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(datosEntrada)



hist(datosRecortados$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()