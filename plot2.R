data <- read.table("C:/Users/Eathish/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


date_time <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(date_time, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
