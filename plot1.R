## read the data and convert "Date" column to a Date class
df <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, head=TRUE)
library(lubridate)
df$Date <-as.Date(df$Date, "%d/%m/%Y")
library(dplyr)

## subset the data frame to only include the two days
df2 <- filter(df, between(Date, as.Date("2007-02-01"), as.Date("2007-02-02")))

## plot1 using default Windows graphics device
hist(as.numeric(df2$Global_active_power), xlab ="Global Active Power (kilowatts)", main ="Global Active POwer", col = "red")

## plot1.png
png(file="plot1.png", width=480, height=480, units="px")
hist(as.numeric(df2$Global_active_power), xlab ="Global Active Power (kilowatts)", main ="Global Active Power", col = "red")
dev.off()

