# Projeto
library(lubridate)

## Dataset Description:    Measurements of electric power consumption in one 
# household with a one-minute sampling rate over a period of almost 4 years.
# Different electrical quantities and some sub-metering values are available.

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dest = ".\\COURSERA\\4. Exploratory Data Analysis\\Week 1\\Projeto\\household_power_consumption.zip"
download.file(fileURL, destfile = dest)

file <- unzip(dest)

# Read column names
data_names <- read.table(file, nrows = 1, sep = ";", stringsAsFactors = F)

# Read dataset: 2007-02-01 - 2007-02-02
data_set <- read.table(file, sep = ";", skip = 66637, nrows = 2880, 
                       col.names = data_names, stringsAsFactors = F)

# Create DateTime
data_set$DateTime <- paste(data_set$Date, data_set$Time)

# Convert in date
data_set$DateTime <- dmy_hms(data_set$DateTime)


# Plot 3

with(data_set, plot(DateTime, Sub_metering_1, type="l", xlab = "", 
                    ylab = "Energy sub metering"))
lines(data_set$DateTime, data_set$Sub_metering_2, type="l", col = "red")
lines(data_set$DateTime, data_set$Sub_metering_3, type="l", col = "blue")
legend("topright", lty = 1 , col = c("black", "red", "blue"),  
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", width = 480, height = 480) 
dev.off()