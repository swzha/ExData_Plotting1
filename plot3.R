## read the data only the two days 2007-2-1 and 2007-2-2
File1 <- read.table("household_power_consumption.txt",header = FALSE,stringsAsFactors = FALSE, sep = ";", col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), skip=grep("31/1/2007", readLines("household_power_consumption.txt")), nrows=4320)
df1 <- File1[1440:4319,]

## create a new datetime column by combining Date and Time clolumns
library(lubridate)
library(dplyr)
data <- mutate(df1, datetime=paste(df1$Date, df1$Time))
data$datetime <- strptime(data$datetime,"%d/%m/%Y %T")

## plot the graph with three plot lines and legend
png(file="plot3.png", width=480, height=480, units="px")
plot(data$datetime, data$Sub_metering_1, xlab="", ylab = "Energy sub metering",type="l")
par(new = TRUE)
plot(data$datetime, data$Sub_metering_2, ylim=range(c(data$Sub_metering_1, data$Sub_metering_2)), axes=FALSE, xlab="", ylab = "",type="l", col="red")
par(new=TRUE)
plot(data$datetime, data$Sub_metering_3, ylim=range(c(data$Sub_metering_1, data$Sub_metering_2)), axes=FALSE, xlab="", ylab = "",type="l", col="blue")
legend("topright", col = c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1))
dev.off()
