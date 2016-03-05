# This is one time file download into the folder Exproject and
# Unzip the file under the same folder

if(!file.exists("./Exproject")){dir.create("./Exproject")}
Url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(Url,destfile="./Exproject/Dataset.zip",method="libcurl")
unzip(zipfile="./Exproject/Dataset.zip",exdir="./Exproject")

#Path variable set
path_rf<-file.path("./Exproject")

# Reading data 
data <- read.table(file.path(path_rf, "household_power_consumption.txt" ),header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset data
AssignmentData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# convert type to numeric
global_active_power<-as.numeric(AssignmentData$Global_active_power)

# set the graphic device to png
png("plot1.png", width=480, height=480)

# Plot Histogram
hist(global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Graphic device turned off

dev.off()