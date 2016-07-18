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
png("plot2.png", width=480, height=480)
with(data1,plot(comdate, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()