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

# create a line plot Global Active Power column against DateTime column with no x label
# and save onto a PNG file
png('plot2.png')
plot(real$DateTime, 
     real$Global_active_power, 
     type ="l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()

