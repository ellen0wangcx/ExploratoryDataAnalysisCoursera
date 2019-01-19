filename  <- "88michael/datasciencecoursera/class4/Project1/household_power_consumption.txt"
data <- read.table(filename, header = TRUE, sep = ";", colClasses = c("character","character", rep("numeric",7)), na = "?")
dim(data)
attach(data)
subset <- Date == "1/2/2007" | Date == "2/2/2007"
newData <- data[subset, ]
attach(newData)
x <- paste(Date, Time)
newData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(newData) <- 1:nrow(newData)
dim(newData)
attach(newData)
