if (!file.exists("household_power_consumption.txt")) {
  stop("Please download the household_power_consumption.txt in the working directory")
} else
data <- read.table("household_power_consumption.txt", sep =";", na.strings="?", header = TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
actual <- subset(data, data$Date >= "2007-02-01", 1:9)
actual2 <- subset(actual, actual$Date <= "2007-02-02", 1:9)
actual2$DateTime <- paste(actual2$Date, actual2$Time) 
actual2$DateTime <- as.character(actual2$DateTime)
actual2$DateTime <- strptime(actual2$DateTime, "%Y-%m-%d %H:%M:%S")
## my locale is not English, so we have to back it up and change temporarily it to English
loc <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "C")
plot(actual2$DateTime, actual2$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(device=png, "plot2.png")
dev.off()
## restoring the locale
Sys.setlocale("LC_TIME", loc)