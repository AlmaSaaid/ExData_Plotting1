#the power data resides in this directory of my local computer
setwd("C:/Users/tm35082/Desktop/New files/Cousera/Module4")

power.get.data <- "./data/household_power_consumption.txt"
power.data <- read.table(power.get.data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
sub.power <- power.data[power.data$Date %in% c("1/2/2007","2/2/2007") ,]

#change to R date time format
new.datetime <- strptime(paste(sub.power$Date, sub.power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#change these variables to numeric 
global.active.pwr <- as.numeric(sub.power$Global_active_power)
global.reactive.pwr <- as.numeric(sub.power$Global_reactive_power)
sub.voltage <- as.numeric(sub.power$Voltage)
sub.metering1 <- as.numeric(sub.power$Sub_metering_1)
sub.metering2 <- as.numeric(sub.power$Sub_metering_2)
sub.metering3 <- as.numeric(sub.power$Sub_metering_3)

#prepare the .png file first
png("plot4.png", width=480, height=480)

#set the panel of 2x2
par(mfrow = c(2, 2)) 

#plot the line chart of global active power
plot(new.datetime, global.active.pwr, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#plot the line chart of global reactive power
plot(new.datetime, sub.voltage, type="l", xlab="Date & Time", ylab="Voltage")

plot(new.datetime, sub.metering1, type="l", ylab="Energy Submetering", xlab="")
lines(new.datetime, sub.metering2, type="l", col="red")
lines(new.datetime, sub.metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(new.datetime, global.reactive.pwr, type="l", xlab="Date & Time", ylab="Global Reactive Power")

dev.off()
