library(datasets)

setwd("~/Desktop/project1")
rawData <- read.csv("power.txt", sep=";", stringsAsFactors=FALSE)

filteredData <- rawData[rawData$Date == "1/2/2007" | rawData$Date == "2/2/2007",]

gap <- as.numeric(filteredData[[3]])
volt <- as.numeric(filteredData[[5]])

par(mfrow = c(2, 2))

plot(gap, type="l", ylab="Global Active Power", xlab="", xaxt='n')
axis(1, 1, "Thu")
axis(1, 1440, "Fri")
axis(1, 2880, "Sat")

plot(volt, type="l", ylab="Voltage", xlab="datetime", xaxt='n')
axis(1, 1, "Thu")
axis(1, 1440, "Fri")
axis(1, 2880, "Sat")

sub1 <- as.numeric(filteredData[[7]])
sub2 <- as.numeric(filteredData[[8]])
sub3 <- as.numeric(filteredData[[9]])

plot(sub1, type="l", ylab="Energy sub metering", xlab="", xaxt='n')
lines(sub2, col="red")
lines(sub3, col="blue")
axis(1, 1, "Thu")
axis(1, 1440, "Fri")
axis(1, 2880, "Sat")
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub1", "Sub2", "Sub3"))

grp <- as.numeric(filteredData[[4]])
plot(grp, type="l", ylab="Global_reactive_power", xlab="datetime", xaxt='n')
axis(1, 1, "Thu")
axis(1, 1440, "Fri")
axis(1, 2880, "Sat")

dev.copy(png, file="plot4.png")
dev.off()
