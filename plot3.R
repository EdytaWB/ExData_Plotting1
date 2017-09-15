# reading the required electric power consumption data
dataset <- read.table("household_power_consumption.txt", header = T, sep = ";", 
                      stringsAsFactors = F)

# subsetting the dataset 
data <- subset(dataset, Date == "1/2/2007" | Date == "2/2/2007")

# transforming the Date and Time character variables into a new variable in a proper 
# date format
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# creating the plot in a PNG file
png(filename = "plot3.png", width = 480, height = 480)

plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering")

lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), col = c("black", "red", "blue"))

dev.off()

