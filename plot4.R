# reading the required electric power consumption data
dataset <- read.table("household_power_consumption.txt", header = T, sep = ";", 
                      stringsAsFactors = F) 

# subsetting the dataset 
data <- subset(dataset, Date == "1/2/2007" | Date == "2/2/2007")

# transforming the Date and Time character variables into a new variable in a proper 
# date format
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

#creating the plots in a PNG file
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

#plot 1
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power")

#plot 2
plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", 
     ylab = "Voltage")

#plot 3
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", inset = .02, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), col = c("black", "red", "blue"), box.lty = 0)

#plot 4
plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off()
