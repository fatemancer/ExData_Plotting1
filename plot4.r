data <- read.table("household_power_consumption.txt", sep =";", na.strings="?", header = TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
actual <- subset(data, data$Date >= "2007-02-01", 1:9)
actual2 <- subset(actual, actual$Date <= "2007-02-02", 1:9)
actual2$DateTime <- paste(actual2$Date, actual2$Time) 
actual2$DateTime <- as.character(actual2$DateTime)
actual2$DateTime <- strptime(actual2$DateTime, "%Y-%m-%d %H:%M:%S")
png("plot4.png")
par(mfcol = c(2,2))
##1st
plot(actual2$DateTime, actual2$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
##2nd
plot(actual2$DateTime, actual2$Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering")
points(actual2$DateTime, actual2$Sub_metering_3, type="l", col="blue")
points(actual2$DateTime, actual2$Sub_metering_2, type="l", col="red")
points(actual2$DateTime, actual2$Sub_metering_1, type="l", col="black")
legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
##3rd
plot(actual2$DateTime, actual2$Voltage, type = "l", xlab="datetime", ylab="Voltage")
##4th
plot(actual2$DateTime, actual2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()