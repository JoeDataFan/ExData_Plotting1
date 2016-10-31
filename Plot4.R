# Coursera Exploratory Data Analysis week 1 peer reviewed assignment plot4
# 10-29-2016

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
par(mfcol = c(2,2), 
    mar = c(5,4,3,2),
    bg = "white", 
    lwd = 0.25)
    

########first graph (top left corner)
#plot histogram of "Global Active Power" with red bars and all proper labels
plot(data$index, data$Global_active_power,
     xlab = "" ,
     lwd = 0.5, 
     ylab = "Global Active Power", 
     type = "l", 
     xaxt = "n")

#establish position and labels for x axis according to week day
tick<-c(1,1441,2880)
xlabels<-c("Thu","Fri", "Sat")

# annotate plot with new labels
axis(side = 1, labels = xlabels, at = tick)


######## second graph (bottom left corner)
#plot histogram of "Global Active Power" with red bars and all proper labels
plot(data$index, data$Sub_metering_1,
     xlab = "" , 
     lwd = 0.5, 
     ylab = "Energy sub metering",
     type = "n", 
     xaxt = "n")

#add line graphs for each sub metering
points(data$index, data$Sub_metering_1, lwd = 0.5, type = "l")
points(data$index, data$Sub_metering_2, lwd = 0.5, type = "l", col = "red")
points(data$index, data$Sub_metering_3, lwd = 0.5, type = "l", col = "blue")

#add a legend
legend(2000,38, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       xjust = 0.5, 
       bty = "n",
       col = c("black", "red", "blue"), 
       lty = 1,
       cex = 1, 
       x.intersp = 1,
       y.intersp = 1) 

#establish position and labels for x axis according to week day
tick<-c(1,1441,2880)
xlabels<-c("Thu","Fri", "Sat")

# annotate plot with new labels
axis(side = 1, labels = xlabels, at = tick)


####### third graph (top right corner)
#plot histogram of "Global Active Power" with red bars and all proper labels
plot(data$index, data$Voltage, 
     lwd = 0.5,  
     xlab = "datetime" ,
     ylab = "Voltage",
     type = "l", 
     xaxt = "n")

#establish position and labels for x axis according to week day
tick<-c(1,1441,2880)
xlabels<-c("Thu","Fri", "Sat")

# annotate plot with new labels
axis(side = 1, labels = xlabels, at = tick)


####### forth graph (bottom right corner)
#plot histogram of "Global Active Power" with red bars and all proper labels
plot(data$index, data$Global_reactive_power, 
     lwd = .25, xlab = "datetime" , 
     ylab = "Global_reactive_power", 
     type = "l", 
     xaxt = "n")

#establish position and labels for x axis according to week day
tick<-c(1,1441,2880)
xlabels<-c("Thu","Fri", "Sat")

# annotate plot with new labels
axis(side = 1, labels = xlabels, at = tick)

#copy current graph to png file
dev.copy(png, file = "Plot4.png", width = 600, height = 600)

#close png graphic device
dev.off()
