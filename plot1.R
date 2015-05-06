## set working directory
setwd("~/Documents/coursera/EDA_project_1")
## load txt file to data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
## date convert
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
## subset data on dates ranging from 2007-02-01 to 2007-02-02
data <- subset(data, Date <= "2007-02-02" & Date >= "2007-02-01")
## time convert
data$Time <- strptime(data$Time, "%H:%M:%S")
## convert
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

##save graph "plot1"
png(filename = "Plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab= "Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
