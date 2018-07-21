##  Exploratory Data Analysis - Week 1 Course Project

## Get dataset
filename <- "household_power_consumption.txt"
hpc <- read.table(text = grep("^[1,2]/2/2007", readLines(filename), value = TRUE), 
                  header = TRUE, 
                  sep = ";", 
                  col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Convert the Date and Time variables to Date/Time classes in R using the strptime()and as.Date() functions.
# Convert Date
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

# Combine Date and Time column
dateTime <- paste(hpc$Date, hpc$Time)

# Format dateTime column
hpc$dateTime <- as.POSIXct(dateTime)

## PLOT 2
# Set plot window margins
par(mar=c(5,5,4,2))

# Create the plot
plot(hpc$Global_active_power ~ hpc$dateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# copy plot to PNG file then close device
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()

