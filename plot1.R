# plot1.r runs a cript to creat the first plot required for the JHU ExData Assignment 1.

library(dplyr)

data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- as.POSIXct(strptime(data$Time, "%H:%M:%S"))
data2 <- filter(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")


data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))

png(file = "plot1.png",
    width = 480, height = 480, units = "px")
hist(data2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()