# Generate line graph with title
setwd("C:/R-Course")
data <- read.table("household_power_consumption.txt",
                   sep=";",skip=0, header = TRUE, stringsAsFactors=FALSE,
                   na.strings = "?")
subset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
subset$DateTime <- strptime(paste(subset$Date,subset$Time), "%d/%m/%Y %H:%M:%S")
subset <- subset[subset$DateTime >= '2007-02-01 00:00:00' &  
                   subset$DateTime < '2007-02-03 00:00:00' &
                   !is.na(subset$DateTime),]

png(file = "plot2.png")
plot(subset$DateTime, subset$Global_active_power, 
     type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()