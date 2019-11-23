# plot2.r runs a script to create the first plot required for the JHU ExData Assignment 1.

library(dplyr)

#read data and change class from factor to date/time
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#subset based on dates of interest and create new merged datetime variable
data2 <- filter(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")
data2$datetime <- strptime(paste(data2$Date, data2$Time), format = "%Y-%m-%d %H:%M:%S")
    
#change class from factor to numeric
data2$Sub_metering_1 <- as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2 <- as.numeric(as.character(data2$Sub_metering_2))
data2$Sub_metering_3 <- as.numeric(as.character(data2$Sub_metering_3))

#create png graphic and save directly to png file
png(file = "plot3.png",
    width = 480, height = 480, units = "px")

with(data2, plot(datetime, Sub_metering_1, type="l", 
                 ylab = "Energy sub metering", xlab =""))
points(data2$datetime, data2$Sub_metering_2, type = "l", col = "red")
points(data2$datetime, data2$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col= c("black", "red", "blue"), lty = c(1,1,1))

dev.off()