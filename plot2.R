# Please notice that in Russian weekdays are abbreviated just as they are 
# on this plot. Thanks for understanding. :-)
# Considering that unzipped file is in your working directory.
# Reading data only about two required days.
# Creating one datetime variable.
mydata <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),
                     sep = ";", na.strings = "?", stringsAsFactors = FALSE)
mydata <- transform(mydata, timestamp=as.POSIXct(paste(V1, V2), 
                                                 format="%d/%m/%Y %H:%M:%S"))
# Creating a needed plot.
plot(mydata$timestamp, mydata$V3, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
# Copying to a png file and closing the connection.
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()