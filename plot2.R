# reading the required electric power consumption data
dataset <- read.table("household_power_consumption.txt", header = T, sep = ";", 
                      stringsAsFactors = F)

# subsetting the dataset 
data <- subset(dataset, Date == "1/2/2007" | Date == "2/2/2007")

# transforming the Date and Time character variables into a new variable in a proper 
# date format
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")


# creating the plot in a PNG file
png(filename = "plot2.png", width = 480, height = 480)

plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

dev.off()

