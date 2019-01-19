if (!"neiData" %in% ls()) {
  neiData <- readRDS("./datasciencecoursera/class4/Project2/exdata-data-NEI_data/summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
  sccData <- readRDS("./datasciencecoursera/class4/Project2/exdata-data-NEI_data/Source_Classification_Code.rds")
}
subset <- neiData[neiData$fips == "24510", ]


par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./datasciencecoursera/class4/Project2/plot5.png", 
    width = 480, height = 480, 
    units = "px")

motor <- grep("motor", sccData$Short.Name, ignore.case = T)
motor <- sccData[motor, ]
motor <- subset[subset$SCC %in% motor$SCC, ]
motorEmissions <- aggregate(motor$Emissions, list(motor$year), FUN = "sum")

plot(motorEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions From Motor Vehicle Sources\n from 1999 to 2008 in Baltimore City", 
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()
