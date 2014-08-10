datosEntrada <- read.csv("household_power_consumption.txt",stringsAsFactors=F, header=T, sep=';', na.strings="?",)

datosEntrada$Date <- as.Date(datosEntrada$Date, format="%d/%m/%Y")
datosRecortados <- subset(datosEntrada, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
dateTime <- paste(datosRecortados$Date, datosRecortados$Time)
dateTime2 <- as.POSIXct(dateTime, format = "%Y-%m-%d %H:%M:%S")
datosRecortados$DateAndTime <- dateTime2
rm(datosEntrada)
rm(dateTime)
rm(dateTime2)

par(mfrow=c(2,2), mar=c(3,3,3,3))
 
plot(datosRecortados$Global_active_power~datosRecortados$DateAndTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  

plot(datosRecortados$Voltage~datosRecortados$DateAndTime, type="l", 
       ylab="Voltage (volt)", xlab="")
  

plot(datosRecortados$Sub_metering_1~datosRecortados$DateAndTime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
lines(datosRecortados$Sub_metering_2~datosRecortados$DateAndTime,col='Red')
lines(datosRecortados$Sub_metering_3~datosRecortados$DateAndTime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1,  
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


plot(datosRecortados$Global_reactive_power~datosRecortados$DateAndTime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()