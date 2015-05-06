## set working directory
setwd("~/Documents/coursera/EDA_project_1")
## load txt file to data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
## date convert
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
## subset data on dates ranging from 2007-02-01 to 2007-02-02
data <- subset(data, Date <= "2007-02-02" & Date >= "2007-02-01")

##newColumn date time
data$newdate <- paste(data$Date, data$Time, sep = " ")
data$newdate <- strptime(data$newdate, format="%Y-%m-%d %H:%M:%S")

## convert
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

##save graph "plot4"
png(filename = "Plot4.png", width = 480, height = 480)
par(mfrow= c(2,2))
with(data,{
    plot(data$newdate, data$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type = "l")
    plot(data$newdate, data$Voltage, ylab = "Voltage", xlab = "datatime", type = "l")
    plot(data$newdate, data$Sub_metering_1, ylab="Energy sub metering", xlab="", type = "l", )
    lines(data$newdate, data$Sub_metering_2, col = "red",ylab="Energy sub metering", xlab="", type = "l")
    lines(data$newdate, data$Sub_metering_3, col = "blue",ylab="Energy sub metering", xlab="", type = "l")
    legend("topright", lty = 1:1 , col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")
    plot(data$newdate, data$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datatime", type = "l")
    })

dev.off()
