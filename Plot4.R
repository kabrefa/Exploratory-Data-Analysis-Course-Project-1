## Loading the Dataset into R
electricData <- "./datasciencecoursera/household_power_consumption.txt"
data <- read.table(electricData, header = T, sep = ";", stringsAsFactors = F, dec = ".")

## Converting Date and Time
y <- strptime(paste(subPeriod$Date, subPeriod$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## Creating a subset of the Dataset
subPeriod <- data[data$Date %in% c("1/2/2007", "2/2/2007") ,]

## Constructing Plot4
x <- as.numeric(subPeriod$Global_active_power)
z <- as.numeric(subPeriod$Global_reactive_power)
v <- as.numeric(subPeriod$Voltage)
subMetering1 <- as.numeric(subPeriod$Sub_metering_1)
subMetering2 <- as.numeric(subPeriod$Sub_metering_2)
subMetering3 <- as.numeric(subPeriod$Sub_metering_3)

par(mfrow = c(2, 2)) 

plot(y, x, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)

plot(y, v, type = "l", xlab = "datetime", ylab = "Voltage")

plot(y, subMetering1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(y, subMetering2, type = "l", col = "red")
lines(y, subMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"), bty = "o")

plot(y, z, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

## Copying my plot to a PNG file
dev.copy(png, file = "plot4.png", width = 480, height = 480)

## Don't forget to close the PNG device!
dev.off()
