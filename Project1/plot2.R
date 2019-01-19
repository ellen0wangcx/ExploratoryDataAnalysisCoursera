filename <- "./datasciencecoursera/class4/Project1/household_power_consumption.txt"
data <- read.table(filename, header = TRUE, sep = ";", colClasses = c("character","character", rep("numeric",7)), na = "?")
data2 <- data[as.character(data$Date) %in% c("1/2/2007","2/2/2007"),]
data2$dateTime = paste(data2$Date, data2$Time)
data2$dateTime <- strptime(data2$dateTime, "%d/%m/%Y %H:%M:%S")
attach(data2)



png(filename = "plot2.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
plot(dateTime, Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
