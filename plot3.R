# load of data
house_hold = "household_power_consumption.txt"
data = read.table(house_hold, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# take the part of data needed
part_of_Data = data[data$Date %in% c("1/2/2007","2/2/2007") ,]
# keep the days in english and save time and date
Sys.setlocale("LC_TIME", "English")
date_time = strptime(paste(part_of_Data$Date, part_of_Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower = as.numeric(part_of_Data$Global_active_power)

#sub mrtering to numeric
subMetering1 = as.numeric(part_of_Data$Sub_metering_1)
subMetering2 = as.numeric(part_of_Data$Sub_metering_2)
subMetering3 = as.numeric(part_of_Data$Sub_metering_3)

#plotting and saving
png("plot3.png", width=480, height=480)
plot(date_time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, subMetering2, type="l", col="red")
lines(date_time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
