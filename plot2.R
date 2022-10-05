# file name
house_hold = "household_power_consumption.txt"

# read file with separated by ";" 
data = read.table(house_hold, header=TRUE, sep=";", 
                  col.names =c("date", "time", "globalActivePower",
                               "globalReactivePower", "voltage","globalIntensity",
                               "subMetering1", "subMetering2", "subMetering3"),
                  colClasses = c("character", "character", rep("numeric",7) ), na.strings="?")
# convert Date type
data$date = as.Date(data$date, format="%d/%m/%Y")
# filter dates SUBSETTING of data
data = data[data$date >= as.Date("2007-02-01") & data$date<=as.Date("2007-02-02"),]

# plot line chart and save graph as PNG file with width and hight of 480
png("plot2.png", 480, 480, units="px")
plot(data$globalActivePower, type="l",xaxt="n", xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(1, as.integer(nrow(data)/2), nrow(data)), labels=c("Thu", "Fri", "Sat"))
# close of PNG file
dev.off()

