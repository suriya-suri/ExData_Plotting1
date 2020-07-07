data <- read.table("C:/Users/Eathish/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

date_time <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
submeter1 <- as.numeric(subSetData$Sub_metering_1)
submeter2 <- as.numeric(subSetData$Sub_metering_2)
submeter3 <- as.numeric(subSetData$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(date_time, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(date_time, submeter1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, submeter2, type="l", col="red")
lines(date_time, submeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(date_time, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
