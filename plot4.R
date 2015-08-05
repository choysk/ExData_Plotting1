powerData <- read.csv("./exdata-data-household_power_consumption/household_power_consumption.txt", 
                     header=TRUE, sep=';', na.strings="?", stringsAsFactors=FALSE)

graphData <- powerData[powerData$Date %in% c("1/2/2007", "2/2/2007"), ]

graphData$DateTime <- strptime(paste(graphData$Date, graphData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2), mar=c(4,4,3,3), oma=c(0,2,0,2))

plot(graphData$DateTime, graphData$Global_active_power, type="l", 
       ylab="Global Active Power", xlab="")

plot(graphData$DateTime, graphData$Voltage, type="l", 
       ylab="Voltage", xlab="datetime")

plot(graphData$DateTime, graphData$Sub_metering_1, type="l", 
       ylab="Global Active Power", xlab="")
lines(graphData$DateTime, graphData$Sub_metering_2,col='Red')
lines(graphData$DateTime, graphData$Sub_metering_3,col='Blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), lwd=c(1,1,1), bty="n", col=c("black", "red", "blue"))

plot(graphData$DateTime, graphData$Global_reactive_power, type="l", 
       ylab="Global Rective Power",xlab="datetime")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()