# file name
house_hold = "household_power_consumption.txt"

# read file with separated(sep) by ";" 
data = read.table(house_hold, header=TRUE, sep=";", 
                  col.names =c("date", "time", "globalActivePower",
                               "globalReactivePower", "voltage","globalIntensity",
                               "subMetering1", "subMetering2", "subMetering3"),
                  colClasses = c("character", "character", rep("numeric",7) ), na.strings="?")
# convert Date type
data$date = as.Date(data$date, format="%d/%m/%Y")
# filter dates 
data = data[data$date >= as.Date("2007-02-01") & data$date<=as.Date("2007-02-02"),]

# plot histogram and save graph as PNG file with width and hight of 480

png("plot1.png", 480, 480, units="px")
hist(data$globalActivePower, col="red", 
     main="Global Active Power", xlab="Global Active Power (kilowatts)")
# close of PNG file
dev.off()

