# Coursera Exploratory Data Analysis week 1 peer reviewed assignment plot3
# 10-29-2016
#Data provided for the assignment (through the link within to assingment notes) was 
#first downloaded into the working directory and then extracted from the zip file. 
#R script was then used to open and subset the needed portion of the data for the 
#assignment.
  
library(lubridate)

# open data set (text file)... using only the the following dates 2007-2-01 and 2007-2-02
data<-subset(read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?"), Date == "1/2/2007" | Date == "2/2/2007")

# convert Date and Time variables to proper date and formal class period formats
data$Date<-dmy(data$Date)
data$Time<-hms(data$Time)

# add an index
data$index<-seq(1,2880, by = 1)

# convert Date to day of week
data$Date<-wday(data$Date, label = TRUE)

#set graph to 6.4 inches by 6.4 inches so png file image is roughly 480 by 480 pixels
par(pin = c(6.4,6.4), mar = c(2,3,3,2))

#open a png file to create the graph in
png(filename = "Plot3.png")

#plot histogram of "Global Active Power" with red bars and all proper labels
plot(data$index, data$Sub_metering_1,xlab = "" , ylab = "Energy sub metering", type = "n", xaxt = "n")

#add line graphs for each sub metering
points(data$index, data$Sub_metering_1, type = "l")
points(data$index, data$Sub_metering_2, type = "l", col = "red")
points(data$index, data$Sub_metering_3, type = "l", col = "blue")

#add a legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1 ) 
#establish position and labels for x axis according to week day
tick<-c(1,1441,2880)
xlabels<-c("Thu","Fri", "Sat")

# annotate plot with new labels
axis(side = 1, labels = xlabels, at = tick)

#close png graphic device
dev.off()
