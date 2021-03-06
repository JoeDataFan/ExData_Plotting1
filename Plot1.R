# Coursera Exploratory Data Analysis week 1 peer reviewed assignment plot1
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

#set graph to 6.4 inches by 6.4 inches so png file image is roughly 480 by 480 pixels
par(pin = c(6.4,6.4))

#open a png file to create the graph in
png(filename = "Plot1.png")

#plot histogram of "Global Active Power" with red bars and all proper labels
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

#close png graphic device
dev.off()

