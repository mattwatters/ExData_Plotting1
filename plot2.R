# Load data
dataTypes <- c("character", "character", rep("numeric", 7))
data.raw <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = dataTypes, na.strings = "?")

# Subset data
data <- data.raw[data.raw$Date %in% c("1/2/2007","2/2/2007"),]
data$DateTime = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Draw line graph
plot(data$DateTime, data $Global_active_power, "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Copy to PNG
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()