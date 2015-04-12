# read the text file into a data frame and convert the Date column from factor to Date
dataset <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")

# define the upper and lower bound dates that are relevant
date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")

# create a data frame containing only the relevant dates as defined above
feb1 <- dataset[dataset$Date == date1, ]
feb2 <- dataset[dataset$Date == date2, ]
real <- rbind(feb1,feb2)

# create a histogram of Global Active Power column and save it to a PNG file
png('plot1.png')
hist(real$Global_active_power, 
        col = "red", 
        main = "Global Active Power", 
        xlab = "Global Active Power (kilowatts)", 
        ylab = "Frequency")
dev.off()