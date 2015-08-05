#powerData <- read.csv("./exdata-data-household_power_consumption/household_power_consumption.txt", 
#                      header=TRUE, sep=';', na.strings="?", stringsAsFactors=FALSE)

graphData <- powerData[powerData$Date %in% c("1/2/2007", "2/2/2007"), ]

graphData$DateTime <- strptime(paste(graphData$Date, graphData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

par(mfrow=c(1,1), mar=c(5,5,5,0), oma=c(0,0,0,0))
plot(graphData$DateTime, graphData$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(graphData$DateTim, graphData$Sub_metering_2, type="l", col="red")
lines(graphData$DateTim, graphData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), lwd=c(1,1,1), col=c("black", "red", "blue"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()