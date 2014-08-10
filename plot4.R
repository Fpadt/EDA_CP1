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
png(filename = "plot4.png", width = 480, height = 480)

par(mfcol = c(2,2))
#Plot2
plot(hpc$DT, hpc$Global_active_power,
     type = "l",
     main = "",
     ylab = "Global Active Power (kilowatts)",
     xlab = ""
     )

#Plot3
plot(hpc$DT, hpc$Sub_metering_1,
     type = "n",
     main = "",
     ylab = "Energy sub metering",
     xlab = ""
     )

lines(hpc$DT, hpc$Sub_metering_1, col = "BLACK")
lines(hpc$DT, hpc$Sub_metering_2, col = "RED")
lines(hpc$DT, hpc$Sub_metering_3, col = "BLUE")

legend("topright", 
       legend = c("Sub_metering_1", 
                  "Sub_metering_2",
                  "Sub_metering_3"
       ),
       col = c("BLACK", "RED", "BLUE"),
       lty = 1,
       lwd = 1, 
       cex = 0.5
)


plot(hpc$DT, hpc$Voltage,
     type = "l",
     main = "",
     ylab = "Voltage",
     xlab = "datetime"
     )

plot(hpc$DT, hpc$Global_reactive_power,
     type = "l",
     main = "",
     ylab = "Global_reactive_power",
     xlab = "datetime"
)


# close device
dev.off()
