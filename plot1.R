# Considering that unzipped file is in your working directory.
# Reading data only about two required days.
mydata <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),
                     sep = ";", na.strings = "?")
# Plotting a needed histogram.
hist(mydata$V3, col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
# Copying to a png file and closing the connection.
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()