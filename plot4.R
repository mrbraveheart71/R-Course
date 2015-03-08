# Generate 4 graphs for Plot 4 in assignment
setwd("C:/R-Course")
data <- read.table("household_power_consumption.txt",
                   sep=";",skip=0, header = TRUE, stringsAsFactors=FALSE,
                   na.strings = "?")
subset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
subset$DateTime <- strptime(paste(subset$Date,subset$Time), "%d/%m/%Y %H:%M:%S")
subset <- subset[subset$DateTime >= '2007-02-01 00:00:00' &  
                   subset$DateTime < '2007-02-03 00:00:00' &
                   !is.na(subset$DateTime),]

png(file = "plot4.png")
par(mfrow=c(2,2))
# Plot number 1
plot(subset$DateTime, subset$Global_active_power, 
     type="l", ylab="Global Active Power", xlab="")

# Plot number 2
plot(subset$DateTime, subset$Voltage, 
     type="l", ylab="Voltage", xlab="datetime")

# Plot number 3
plot(subset$DateTime, subset$Sub_metering_1, 
     type="l", ylab="Energy sub metering", xlab="")
lines(subset$DateTime,subset$Sub_metering_2, col="red")
lines(subset$DateTime,subset$Sub_metering_3, col="blue")

legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),
       lty = 1, lwd = 2, bty="n")

# Plot number 4
plot(subset$DateTime, subset$Global_reactive_power, 
     type="l", ylab="Global_reactive_power",xlab="datetime")

dev.off()