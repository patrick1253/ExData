# plot2.r runs a script to create the first plot required for the JHU ExData Assignment 1.

library(dplyr)

#read data and change class from factor to date/time
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#subset based on dates of interest and create new merged datetime variable
data2 <- filter(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")
data2$datetime <- strptime(paste(data2$Date, data2$Time), format = "%Y-%m-%d %H:%M:%S")
    
#change class from factor to numeric
data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))

#create png graphic of histogram and save directly to png file
png(file = "plot2.png",
    width = 480, height = 480, units = "px")
with(data2, plot(datetime, Global_active_power, type="l", 
     ylab = "Global Active Power (kilowatts)", xlab ="")) 
dev.off()