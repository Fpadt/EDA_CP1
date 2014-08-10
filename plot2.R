# Course Project 1

# Clear Memory
rm(list=ls())

# Load Data
hpc <- read.csv("~/ExData_Plotting1/household_power_consumption.txt", 
                sep=";", stringsAsFactors = FALSE, na.strings = "?")
# Subset 2 days
hpc <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")

# convert to date
hpc$DT <- paste(hpc$Date, hpc$Time, sep=" ")
hpc$DT <- strptime(hpc$DT, format = "%d/%m/%Y %H:%M:%S")

# Open PNG device and plot
png(filename = "plot2.png", width = 480, height = 480)

plot(hpc$DT, hpc$Global_active_power,
     type = "l",
     main = "",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

# close device
dev.off()
