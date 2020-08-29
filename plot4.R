
library(dplyr)

data = read.table("household_power_consumption.txt",sep = ";",header = TRUE, stringsAsFactors = FALSE)
data = data %>% filter(as.character(Date) == "1/2/2007" | as.character(Date) == "2/2/2007")

data$DateTime = paste0(data$Date," ",data$Time)
data$DateTime = strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
data$Date = as.Date(data$Date, "%d/%m/%Y") 
data$Global_active_power = as.numeric(data$Global_active_power)

par(mfrow = c(2,2))


plot(data$DateTime, data$Global_active_power,type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

plot(data$DateTime, data$Voltage,type = "l", ylab = "Voltage", xlab = "datetime")

plot(data$DateTime, data$Sub_metering_1,type = "l", ylab = "Energy sub metering", xlab = "")


lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), cex = 0.4, lwd = 1)

plot(data$DateTime, data$Global_reactive_power,type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png")
dev.off()
