# Load data
dataTypes <- c("character", "character", rep("numeric", 7))
data.raw <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = dataTypes, na.strings = "?")

# Subset data
data <- data.raw[data.raw$Date %in% c("1/2/2007","2/2/2007"),]

# Draw histogram
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

# Copy to PNG
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()