# set the working direcotory
setwd("C:/Users/dwivedir/Desktop/datascienceassignment/New folder")
#Read the file
data1 <- read.table("household.txt", header=T, sep=";", na.strings="?")
# read on the relevant dates from the data
data1 <- data1[data1$Date %in% c("1/2/2007","2/2/2007"),]
#combine the date and time into one variable
comdate <-strptime(paste(data1$Date, data1$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
#attach the new column to the data
data1 <- cbind(comdate, data1)
#open graphics device for png
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
with(data1,plot(comdate, Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2))
with(data1,plot(comdate, Voltage, type="l", xlab="datetime", ylab="Voltage"))
with(data1,plot(comdate, Sub_metering_1, type="l", ylab="Energy Submetering", xlab=""))
lines(comdate, data1$Sub_metering_2, type="l", col="red")
lines(comdate, data1$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
with(data1,plot(comdate, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()