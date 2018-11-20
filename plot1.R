## Install and load the appropriate packages
Install.packages("reshape2")
install.packages("docxtractr")
library(reshape2)
library(docxtractr)

myfile<- "getdata_dataset.zip"

## Download and unzip the files:
if (!file.exists(myfile)){
  F_URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(F_URL, myfile)
}  
if (!file.exists("My_Quiz_File")) { 
  unzip(myfile) 
}

mytxtfile <- "household_power_consumption.txt"
gdata <- read.table(mytxtfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- gdata[gdata$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()