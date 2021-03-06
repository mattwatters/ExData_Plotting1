# Load data
dataTypes <- c("character", "character", rep("numeric", 7))
data.raw <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = dataTypes, na.strings = "?")

# Subset data
data <- data.raw[data.raw$Date %in% c("1/2/2007","2/2/2007"),]
data$DateTime = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# 2x2 graph
par(mfrow = c(2,2))

# Draw line graph (top left)
plot(data$DateTime, data $Global_active_power, "l", xlab = "", ylab = "Global Active Power")

# Draw line graph (top right)
plot(data$DateTime, data $Voltage, "l", xlab = "datetime", ylab = "Voltage")

# Draw line graph (bottom left)
plot(data$DateTime, data$Sub_metering_1, "l", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, "l", col = "red")
lines(data$DateTime, data$Sub_metering_3, "l", col = "blue")
legend("topright",lty = 1, bty = "n", cex=0.5, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Draw line graph (bottom right)
plot(data$DateTime, data $Global_reactive_power, "l", xlab = "datetime", ylab = "Global_reactive_power")


# Copy to PNG
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()