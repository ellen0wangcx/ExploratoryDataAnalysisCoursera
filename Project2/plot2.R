# Check if both data exist. If not, load the data.
if (!"neiData" %in% ls()) {
  neiData <- readRDS("./datasciencecoursera/class4/Project2/exdata-data-NEI_data/summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
  sccData <- readRDS("./datasciencecoursera/class4/Project2/exdata-data-NEI_data/Source_Classification_Code.rds")
}
subset <- neiData[neiData$fips == "24510", ]

par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./datasciencecoursera/class4/Project2/plot2.png", 
    width = 480, height = 480, 
    units = "px")

totalEmissions <- aggregate(subset$Emissions, list(subset$year), FUN = "sum")
# options(scipen=0)
# options(scipen=999)
plot(totalEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions in Baltimore City from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()
