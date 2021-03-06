if (!file.exists("household_power_consumption.txt")) {
  stop("Please download the household_power_consumption.txt in the working directory")
  } else
data <- read.table("household_power_consumption.txt", sep =";", na.strings="?", header = TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
actual <- subset(data, data$Date >= "2007-02-01", 1:9)
actual2 <- subset(actual, actual$Date <= "2007-02-02", 1:9)
png(file="plot1.png")
hist(actual2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
