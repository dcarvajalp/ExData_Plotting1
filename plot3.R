graphics.off()
setwd("C:/Users/Teardrop/Documents/R")

DataSet <- read.table("household_power_consumption.txt", 
                      header = TRUE, sep = ";", as.is = TRUE)


SubSet <- subset(DataSet, Date == "1/2/2007" | Date == "2/2/2007")

SubSet$TDate <- do.call(paste, c(SubSet[c("Date", "Time")], sep = " "))
SubSet$TDate <- strptime(SubSet$TDate,  "%d/%m/%Y %H:%M:%S")

SubSet$Sub_metering_1 <- as.numeric(SubSet$Sub_metering_1)
SubSet$Sub_metering_2 <- as.numeric(SubSet$Sub_metering_2)
SubSet$Sub_metering_3 <- as.numeric(SubSet$Sub_metering_3)

leg.txt <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(SubSet, {
        plot(TDate, Sub_metering_1, type = "l", col = "black", 
             ylab = "Energy sub metering",
             xlab = "")
        lines(TDate, Sub_metering_2, col = "red")
        lines(TDate, Sub_metering_3, col = "blue")
        legend("topright", inset = 0.01, leg.txt, lty = 1,col = c("black", "red", "blue"))        
        })
dev.off()