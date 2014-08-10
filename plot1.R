# Course Project 1

# Clear Memory
rm(list=ls())

# Load Data
hpc <- read.csv("~/ExData_Plotting1/household_power_consumption.txt", 
                sep=";", stringsAsFactors = FALSE, na.strings = "?")
# Subset 2 days
hpc <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")

# Open PNG device and plot
png(filename = "plot1.png", width = 480, height = 480)

hist(hpc$Global_active_power, 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col  = "red")

# close device
dev.off()
