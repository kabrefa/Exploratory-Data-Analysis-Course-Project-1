## Loading the Dataset into R
electricData <- "./datasciencecoursera/household_power_consumption.txt"
data <- read.table(electricData, header = T, sep = ";", stringsAsFactors = F, dec = ".")

## Converting Date and Time
y <- strptime(paste(subPeriod$Date, subPeriod$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## Creating a subset of the Dataset
subPeriod <- data[data$Date %in% c("1/2/2007", "2/2/2007") ,]

## Constructing Plot2
x <- as.numeric(subPeriod$Global_active_power)
plot(y, x, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Copying my plot to a PNG file
dev.copy(png, file = "plot2.png", width = 480, height = 480)

## Don't forget to close the PNG device!
dev.off()

