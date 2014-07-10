graphics.off()
setwd("C:/Users/Teardrop/Documents/R")

DataSet <- read.table("household_power_consumption.txt", 
                      header = TRUE, sep = ";", as.is = TRUE)


SubSet <- subset(DataSet, Date == "1/2/2007" | Date == "2/2/2007")

SubSet$TDate <- do.call(paste, c(SubSet[c("Date", "Time")], sep = " "))
SubSet$TDate <- strptime(SubSet$TDate,  "%d/%m/%Y %H:%M:%S")

SubSet$Global_active_power <- as.numeric(SubSet$Global_active_power)

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(SubSet$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()