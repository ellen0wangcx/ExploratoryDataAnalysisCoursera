# Check if both data exist. If not, load the data.
if (!"neiData" %in% ls()) {
  neiData <- readRDS("./datasciencecoursera/class4/Project2/exdata-data-NEI_data/summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
  sccData <- readRDS("./datasciencecoursera/class4/Project2/exdata-data-NEI_data/Source_Classification_Code.rds")
}
head(neiData)
head(sccData)
dim(neiData) # 6497651   6
dim(sccData) # 11717    15
