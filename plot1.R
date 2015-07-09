library(datasets)

setwd("~/Desktop/project1")
rawData <- read.csv("power.txt", sep=";", stringsAsFactors=FALSE)

filteredData <- rawData[rawData$Date == "1/2/2007" | rawData$Date == "2/2/2007",]

x <- as.numeric(filteredData[[3]])

hist(x, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

dev.copy(png, file="plot1.png")
dev.off()
