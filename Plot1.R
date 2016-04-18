## Loading the Dataset into R
electricData <- "./datasciencecoursera/household_power_consumption.txt"
data <- read.table(electricData, header = T, sep = ";", stringsAsFactors = F, dec = ".")

## Creating a subset of the Dataset
subPeriod <- data[data$Date %in% c("1/2/2007", "2/2/2007") ,]

## Constructing Plot1
x <- as.numeric(subPeriod$Global_active_power)
hist(x, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

## Copying my plot to a PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480)

## Don't forget to close the PNG device!
dev.off()

