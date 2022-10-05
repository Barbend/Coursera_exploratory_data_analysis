# data load and sub set
house_hold = "household_power_consumption.txt"
data = read.table(house_hold, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
part_of_Data = data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# keep the days in english and save time and date
date_time = strptime(paste(part_of_Data$Date, part_of_Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot4.png", width=480, height=480)

par(mfrow = c(2,2))
# subplot 1 : Global active power (kilowatts) 
plot(date_time, part_of_Data$Global_active_power, xlab = "",
     ylab = "Global Active Power (kilowatts)", type = "l")
# subplot 2 : Voltage 
plot(date_time, part_of_Data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

subMetering1 = as.numeric(part_of_Data$Sub_metering_1)
subMetering2 = as.numeric(part_of_Data$Sub_metering_2)
subMetering3 = as.numeric(part_of_Data$Sub_metering_3)
# subplot 3 : Energy Submetering 
plot(date_time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, subMetering2, type="l", col="red")
lines(date_time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# subplot 4 : Global_reactive_power
plot(date_time, part_of_Data$Global_active_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()

