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

## PLOT 4
# Set plot window margins
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

## Generating plot
with(hpc, {
  plot(Global_active_power ~ dateTime, type = "l", 
       ylab = "Global Active Power", xlab = "")
  plot(Voltage ~ dateTime, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(Sub_metering_1 ~ dateTime, type = "l", ylab = "Energy sub metering",
       xlab = "")
  lines(Sub_metering_2 ~ dateTime, col = 'Red')
  lines(Sub_metering_3 ~ dateTime, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
         bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ dateTime, type = "l", 
       ylab = "Global_reactive_power", xlab = "datetime")
})

# copy plot to PNG file then close device
dev.copy(png, file = "plot4.png", width=480, height=480)
dev.off()

