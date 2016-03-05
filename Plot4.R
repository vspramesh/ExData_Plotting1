
# Read data and Subset the data

data <- read.table(file.path(path_rf, "household_power_consumption.txt" ),header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
AssignmentData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# convert the data type to numeric

date_time <- strptime(paste(AssignmentData$Date, AssignmentData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power <- as.numeric(AssignmentData$Global_active_power)
sub_Metering1 <- as.numeric(AssignmentData$Sub_metering_1)
sub_Metering2 <- as.numeric(AssignmentData$Sub_metering_2)
sub_Metering3 <- as.numeric(AssignmentData$Sub_metering_3)
global_reactive_power <- as.numeric(AssignmentData$Global_reactive_power)
voltage <- as.numeric(AssignmentData$Voltage)

# set the Graphic device

png("plot4.png", width=480, height=480)

# Set the graph layout 2*2

par(mfrow = c(2, 2)) 

# Plot 4 different graphs


plot(date_time, global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(date_time, sub_Metering1, type="l", ylab="Energy Sub metering", xlab="")
lines(date_time, sub_Metering2, type="l", col="red")
lines(date_time, sub_Metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(date_time, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()