## R script to create plot1

#read .txt file
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,
                   colClasses=c("character","character","numeric","numeric","numeric",
                                "numeric","numeric","numeric","numeric"),
                   na.strings = "?")
str(data)
summary(data)
data <- data[complete.cases(data),]

#Extract the data from the dates 2007-02-01 and 2007-02-02
data$Date <- as.Date(data$Date,c("%d/%m/%Y"))
data<-data[data$Date=="2007-02-01" | data$Date=="2007-02-02",]

#Make the plot1
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

#Copy the plot to a PNG file with a width of 480 pixels and a height of 480 pixels.
dev.copy(png,file = "plot1.png")
dev.off()
