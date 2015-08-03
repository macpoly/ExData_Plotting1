# This script reads in data from the file named
# "household_power_consumption.txt", which needs to be in
# your working directory. Since we're only interested in
# two days' worth of data, my code extracts just the variable
# names and the data for those two days (Feb 1-2, 2007).
#
# The file has 9 variables. I have created a 10th variable,
# datetime, which converts the given Date/Time information
# into POSIXlt format. This makes the x-axes on several of
# the graphs behave nicely.

var.names <- read.table("household_power_consumption.txt",
                        sep = ";", nrows = 1, header = TRUE)

data <- read.table("household_power_consumption.txt",
                    sep = ";", na.strings = "?", 
                    stringsAsFactors = FALSE,
                    skip = 66637, nrows = 2880)

names(data) <- names(var.names)

data$datetime <- strptime(paste(data$Date, data$Time),
                           format = "%d/%m/%Y %H:%M:%S")

# Creating Plot 1

png(file = "plot1.png")

par(mfrow=c(1,1))  # Just in case it wasn't reset from before

hist(data$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col="red")

dev.off()

