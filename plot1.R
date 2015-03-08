# Generate histogram graph with title
setwd("C:/R-Course")
data <- read.table("household_power_consumption.txt",
                    sep=";",skip=0, header = TRUE, stringsAsFactors=FALSE,
                   na.strings = "?")
subset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
subset$DateTime <- strptime(paste(subset$Date,subset$Time), "%d/%m/%Y %H:%M:%S")
subset <- subset[subset$DateTime >= '2007-02-01 00:00:00' &  
                   subset$DateTime < '2007-02-03 00:00:00' &
                 !is.na(subset$DateTime),]
#subset$Global_active_power <- as.numeric(subset$Global_active_power)
png(file = "plot1.png", bg="transparent", type="windows")
hist(subset$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()