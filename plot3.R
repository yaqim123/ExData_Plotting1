
library(dplyr)

data = read.table("household_power_consumption.txt",sep = ";",header = TRUE, stringsAsFactors = FALSE)
data = data %>% filter(as.character(Date) == "1/2/2007" | as.character(Date) == "2/2/2007")

data$DateTime = paste0(data$Date," ",data$Time)
data$DateTime = strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
data$Date = as.Date(data$Date, "%d/%m/%Y") 
data$Global_active_power = as.numeric(data$Global_active_power)



plot(data$DateTime, data$Sub_metering_1,type = "l", ylab = "Energy sub metering", xlab = "")


lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), cex = 0.45)

dev.copy(png, file = "plot3.png")
dev.off()
