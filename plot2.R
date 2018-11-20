#load the file into R and subset the row required
mytxtfile <- "household_power_consumption.txt"
gdata <- read.table(mytxtfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- gdata[gdata$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()