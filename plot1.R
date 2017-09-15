# reading the required electric power consumption data
dataset <- read.table("household_power_consumption.txt", header = T, sep = ";", 
                      stringsAsFactors = F)

# subsetting the dataset 
data <- subset(dataset, Date == "1/2/2007" | Date == "2/2/2007")

# creating the plot in a PNG file
png(filename = "plot1.png", width = 480, height = 480)

hist(as.numeric(data$Global_active_power), col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", main = "Global Active Power" )

dev.off()


