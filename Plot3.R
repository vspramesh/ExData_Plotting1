# Read data and Subset the data


data <- read.table(file.path(path_rf, "household_power_consumption.txt" ),header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
AssignmentData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# convert the date type

date_time <- strptime(paste(AssignmentData$Date, AssignmentData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power <- as.numeric(AssignmentData$Global_active_power)
sub_Metering1 <- as.numeric(AssignmentData$Sub_metering_1)
sub_Metering2 <- as.numeric(AssignmentData$Sub_metering_2)
sub_Metering3 <- as.numeric(AssignmentData$Sub_metering_3)

# set the graphic device

png("plot3.png", width=480, height=480)

# Plot and set the lines and legends

plot(date_time, sub_Metering1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, sub_Metering2, type="l", col="red")
lines(date_time, sub_Metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()