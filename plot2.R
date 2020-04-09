## R script to create plot2

#read .txt file
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,
                   colClasses=c("character","character","numeric","numeric","numeric",
                                "numeric","numeric","numeric","numeric"),
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

#Make the plot2
par(mar=c(3,4,2,2))
plot(data$Time, data$Global_active_power,ylab = "Global Active Power (kilowatts)"
      , type="n")
lines(data$Time, data$Global_active_power)

#Copy the plot to a PNG file with a width of 480 pixels and a height of 480 pixels.
dev.copy(png,file = "plot2.png")
dev.off()


