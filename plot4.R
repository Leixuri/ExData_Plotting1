## R script to create plot3

#read .txt file
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,
                   colClasses=c("character","character","numeric","numeric",
                                "numeric","numeric","numeric","numeric","numeric"),
                   na.strings = "?")
str(data)
summary(data)
data <- data[complete.cases(data),]

#Extract the data from the dates 2007-02-01 and 2007-02-02
data$Time <- with(data,paste(Date,Time))
data$Date <- as.Date(data$Date,c("%d/%m/%Y"))
data<-data[data$Date=="2007-02-01" | data$Date=="2007-02-02",]
library(lubridate)
data$Time <- as.POSIXct(data$Time,tz = "","%d/%m/%Y %H:%M:%OS")

#Make the plot4 directly in graphic device png
png("plot4.png")
par(mar=c(4,4,2,2),mfcol=c(2,2))

#1st
plot(data$Time, data$Global_active_power,ylab = "Global Active Power (kilowatts)"
     ,xlab=" ", type="n")
lines(data$Time, data$Global_active_power)


#2nd
plot(data$Time, data$Sub_metering_1,ylab = "Energy sub metering"
     , type="n", xlab=" ")
lines(data$Time, data$Sub_metering_1)
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")

legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1, col=c("black", "red", "blue"))


#3rd
plot(data$Time, data$Voltage, ylab="Voltage", xlab="datetime", type="n")
lines(data$Time, data$Voltage)


#4th
plot(data$Time, data$Global_reactive_power, ylab="Global_reactive_power", 
     xlab="datetime", type="n")
lines(data$Time, data$Global_reactive_power)

dev.off()


