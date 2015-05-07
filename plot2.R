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

## Convert Global_active_power to numeric.
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

##save graph "plot2"
png(filename = "Plot2.png", width = 480, height = 480)
plot(data$newdate, data$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type = "l")
dev.off()
