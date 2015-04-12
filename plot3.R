# read the text file into a data frame and convert the Date column from factor to Date
dataset <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")

# define the upper and lower bound dates that are relevant
date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")

# create a data frame containing only the relevant dates as defined above
# and create a column called DateTime combining Date and Time columns
feb1 <- dataset[dataset$Date == date1, ]
feb2 <- dataset[dataset$Date == date2, ]
real <- rbind(feb1,feb2)
real$DateTime <- as.POSIXct(paste(real$Date, real$Time), format = "%Y-%m-%d %H:%M:%S")

# create a line plot of the 3 different Sub Metering readings in different colors with
# a corresponding legend in the top right and save to a PNG file
png('plot3.png')
plot(real$DateTime, 
     real$Sub_metering_1, 
     type = "s", 
     col = "black", 
     xlab = "", 
     ylab = "Energy sub metering")
points(real$DateTime, real$Sub_metering_2, type = "s", col = "red")
points(real$DateTime, real$Sub_metering_3, type = "s", col = "blue")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), 
       col = c("black", "red", "blue"))
dev.off()
