library(dplyr)

mydata = read.table("/Users/rose/Documents/Course 4/Week 1 Project/household_power_consumption.txt", sep = ";", header = TRUE)

mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata$Time <- strptime(mydata$Time, format = "%H:%M:%S")
mydata$Time <- format(mydata$Time, "%H:%M:%S")

specific_dates <- c("2007-02-01", "2007-02-02")
filtered_dates <- mydata[mydata$Date %in% specific_dates, ]

filtered_dates$Global_active_power = as.numeric(filtered_dates$Global_active_power)

png("plot1.png", width = 480, height = 480)

hist(filtered_dates$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.off()