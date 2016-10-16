#the power data resides in this directory of my local computer

#set the working directory
setwd("C:/Users/tm35082/Desktop/New files/Cousera/Module4")

power.get.data <- "./data/household_power_consumption.txt"
power.data <- read.table(power.get.data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
sub.power <- power.data[power.data$Date %in% c("1/2/2007","2/2/2007") ,]

#change to R date time format
new.datetime <- strptime(paste(sub.power$Date, sub.power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#change to numeric 
#global.power <- as.numeric(sub.power$Global_active_power)
subMetering1 <- as.numeric(sub.power$Sub_metering_1)
subMetering2 <- as.numeric(sub.power$Sub_metering_2)
subMetering3 <- as.numeric(sub.power$Sub_metering_3)

#prepare the .png file first
png("plot3.png", width=480, height=480)

#plot the respective charts
plot(new.datetime, subMetering1, type="l", ylab="Energy Sub Metering", xlab="")
#add lines
lines(new.datetime, subMetering2, type="l", col="red")
lines(new.datetime, subMetering3, type="l", col="blue")

#add legend accordingly
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()
