graphics.off()
setwd("C:/Users/Teardrop/Documents/R")

DataSet <- read.table("household_power_consumption.txt", 
                      header = TRUE, sep = ";", as.is = TRUE)


SubSet <- subset(DataSet, Date == "1/2/2007" | Date == "2/2/2007")

SubSet$TDate <- do.call(paste, c(SubSet[c("Date", "Time")], sep = " "))
SubSet$TDate <- strptime(SubSet$TDate,  "%d/%m/%Y %H:%M:%S")

SubSet$Global_active_power <- as.numeric(SubSet$Global_active_power)
SubSet$Global_active_power <- as.numeric(SubSet$Global_reactive_power)
SubSet$Voltage <- as.numeric(SubSet$Voltage)
SubSet$Sub_metering_1 <- as.numeric(SubSet$Sub_metering_1)
SubSet$Sub_metering_2 <- as.numeric(SubSet$Sub_metering_2)
SubSet$Sub_metering_3 <- as.numeric(SubSet$Sub_metering_3)

leg.txt <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
attach(SubSet)
plot(TDate, Global_active_power, 
     type = "l", 
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
plot(TDate, Voltage, 
     type = "l", 
     ylab = "Global Active Power (kilowatts)",
     xlab = "datetime")
plot(TDate, Sub_metering_1, type = "l", col = "black", 
     ylab = "Energy sub metering",
     xlab = "")
        lines(TDate, Sub_metering_2, col = "red")
        lines(TDate, Sub_metering_3, col = "blue")
        legend("topright", leg.txt, lty = 1,
               col = c("black", "red", "blue"), 
               pt.cex = 1, cex = 0.8, 
               bty ="n")
plot(TDate, Global_reactive_power, 
     type = "l", 
     ylab = "Global Rective Power ",
     xlab = "datetime")
dev.off()