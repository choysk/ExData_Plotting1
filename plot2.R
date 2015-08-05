powerData <- read.csv("./exdata-data-household_power_consumption/household_power_consumption.txt", 
                      header=TRUE, sep=';', na.strings="?", stringsAsFactors=FALSE)

graphData <- powerData[powerData$Date %in% c("1/2/2007", "2/2/2007"), ]

graphData$DateTime <- strptime(paste(graphData$Date, graphData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

plot(graphData$DateTime, graphData$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()