datosEntrada <- read.csv("household_power_consumption.txt",stringsAsFactors=F, header=T, sep=';', na.strings="?",)

datosEntrada$Date <- as.Date(datosEntrada$Date, format="%d/%m/%Y")
datosRecortados <- subset(datosEntrada, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
dateTime <- paste(datosRecortados$Date, datosRecortados$Time)
dateTime2 <- as.POSIXct(dateTime, format = "%Y-%m-%d %H:%M:%S")
datosRecortados$DateAndTime <- dateTime2
rm(datosEntrada)
rm(dateTime)
rm(dateTime2)

plot(datosRecortados$Global_active_power~datosRecortados$DateAndTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()