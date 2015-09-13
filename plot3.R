# Please notice that in Russian weekdays are abbreviated just as they are 
# on this plot. Thanks for understanding. :-)
# Considering that unzipped file is in your working directory.
# Reading data only about two required days.
# Creating one datetime variable.
mydata <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),
                     sep = ";", na.strings = "?", stringsAsFactors = FALSE)
mydata <- transform(mydata, timestamp=as.POSIXct(paste(V1, V2), 
                                                 format="%d/%m/%Y %H:%M:%S"))
# Opening device.
png("plot3.png")
# Preparing a needed coordinate system.
plot(mydata$timestamp, mydata$V7, xlab = "", ylab = "Energy sub metering", 
     type = "n")
# Adding needed lines.
lines(mydata$timestamp, y = mydata$V7)
lines(mydata$timestamp, y = mydata$V8, col = "red")
lines(mydata$timestamp, y = mydata$V9, col = "blue")
# Adding legend.
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1 , col = c("black", "red", "blue"))
# Closing the device.
dev.off()