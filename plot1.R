#the power data resides in this directory of my local computer
setwd("C:/Users/tm35082/Desktop/New files/Cousera/Module4")

#get data from the uploaded UCI dataset
power.get.data <- "./data/household_power_consumption.txt"
power.data <- read.table(power.get.data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
sub.power <- power.data[power.data$Date %in% c("1/2/2007","2/2/2007") ,]

#change to numeric column
global.power <- as.numeric(sub.power$Global_active_power)

#prepare the .png file first
png("plot1.png", width=480, height=480)

#draw the histogram
hist(global.power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()
