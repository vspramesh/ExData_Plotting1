
# Read data and Subset the data

data <- read.table(file.path(path_rf, "household_power_consumption.txt" ),header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
AssignmentData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#combine date and time

date_time <- strptime(paste(AssignmentData$Date, AssignmentData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power<-as.numeric(AssignmentData$Global_active_power)

# Set Graphic device
png("plot2.png", width=480, height=480)

#Plot the graph

plot(date_time, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()