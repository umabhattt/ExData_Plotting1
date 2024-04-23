library(dplyr)

#unfortuantely, could not figure out how to change the x axis labels to the weekdays but the actual plot is accurate!

mydata = read.table("/Users/rose/Documents/Course 4/Week 1 Project/household_power_consumption.txt", sep = ";", header = TRUE)

mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
#mydata$Time <- strptime(mydata$Time, format = "%H:%M:%S")
#mydata$Time <- format(mydata$Time, "%H:%M:%S")


specific_dates <- c("2007-02-01", "2007-02-02")
filtered_dates <- mydata[mydata$Date %in% specific_dates, ]

filtered_dates$Global_active_power = as.numeric(filtered_dates$Global_active_power)

filtered_dates$datetime <- as.POSIXct(paste(filtered_dates$Date, filtered_dates$Time), format="%Y-%m-%d %H:%M")


filtered_dates$weekday <- factor(weekdays(filtered_dates$datetime), levels = c("Thursday", "Friday", "Saturday"))

png("plot3.png", width = 480, height = 480)
# Create a first line
plot(filtered_dates$datetime, filtered_dates$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
# Add a second line
lines(filtered_dates$datetime, filtered_dates$Sub_metering_2, col = "red")
lines(filtered_dates$datetime, filtered_dates$Sub_metering_3, col = "blue")
# Add a legend to the plot
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),  lty=c(1,1,1))
dev.off()
