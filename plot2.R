#the power data resides in this directory of my local computer
setwd("C:/Users/tm35082/Desktop/New files/Cousera/Module4")

#get data from the uploaded UCI dataset
power.get.data <- "./data/household_power_consumption.txt"
power.data <- read.table(power.get.data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
power.get.data <- power.data[power.data$Date %in% c("1/2/2007","2/2/2007") ,]

#change to R date time format
new.datetime <- strptime(paste(power.get.data$Date, power.get.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#change to numeric column
global.data <- as.numeric(power.get.data$Global_active_power)

#prepare the .png file first
png("plot2.png", width=480, height=480)

#plotting
plot(new.datetime, global.data, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
