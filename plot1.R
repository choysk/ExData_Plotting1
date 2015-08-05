powerData <- read.csv("./exdata-data-household_power_consumption/household_power_consumption.txt", 
                    header=TRUE, sep=';', na.strings="?", stringsAsFactors=FALSE)

graphData <- powerData[powerData$Date %in% c("1/2/2007", "2/2/2007"), ]

hist(graphData$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()