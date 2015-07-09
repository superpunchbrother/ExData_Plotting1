library(datasets)

setwd("~/Desktop/project1")
rawData <- read.csv("power.txt", sep=";", stringsAsFactors=FALSE)

filteredData <- rawData[rawData$Date == "1/2/2007" | rawData$Date == "2/2/2007",]

sub1 <- as.numeric(filteredData[[7]])
sub2 <- as.numeric(filteredData[[8]])
sub3 <- as.numeric(filteredData[[9]])

plot(sub1, type="l", ylab="Energy sub metering", xlab="", xaxt='n')
lines(sub2, col="red")
lines(sub3, col="blue")
axis(1, 1, "Thu")
axis(1, 1440, "Fri")
axis(1, 2880, "Sat")
legend("topright", lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png")
dev.off()
