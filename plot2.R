library(datasets)

setwd("~/Desktop/project1")
rawData <- read.csv("power.txt", sep=";", stringsAsFactors=FALSE)

filteredData <- rawData[rawData$Date == "1/2/2007" | rawData$Date == "2/2/2007",]

x <- as.numeric(filteredData[[3]])

plot(x, type="l", ylab="Global Active Power (kilowatts)", xlab="", xaxt='n')
axis(1, 1, "Thu")
axis(1, 1440, "Fri")
axis(1, 2880, "Sat")

dev.copy(png, file="plot2.png")
dev.off()
