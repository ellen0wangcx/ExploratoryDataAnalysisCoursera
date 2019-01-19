filename <- "./datasciencecoursera/class4/Project1/household_power_consumption.txt"
data <- read.table(filename, header = TRUE, sep = ";", colClasses = c("character","character", rep("numeric",7)), na = "?")
data2 <- data[as.character(data$Date) %in% c("1/2/2007","2/2/2007"),]
data2$dateTime = paste(data2$Date, data2$Time)
data2$dateTime <- strptime(data2$dateTime, "%d/%m/%Y %H:%M:%S")
attach(data2)

png(filename = "plot4.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
par(mfrow = c(2, 2))
## Top-left
plot(dateTime, Global_active_power, 
     type = "l",
     xlab = "", ylab = "Global Active Power")
## Top-right
plot(dateTime, Voltage,
     type = "l",
     xlab = "datetime", ylab = "Voltage")
## Bottom-left
plot(dateTime, Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(dateTime, Sub_metering_2, col = "red")
lines(dateTime, Sub_metering_3, col = "blue")
# Remove the border of legend here.
legend("topright", 
       bty = "n",
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
## Bottom-right
plot(dateTime, Global_reactive_power, 
     type = "l",
     col = "black",
     xlab = "datetime", ylab = colnames(data2)[4])
dev.off()
