
library(dplyr)

data = read.table("household_power_consumption.txt",sep = ";",header = TRUE, stringsAsFactors = FALSE)
data = data %>% filter(as.character(Date) == "1/2/2007" | as.character(Date) == "2/2/2007")

data$DateTime = paste0(data$Date," ",data$Time)
data$DateTime = strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
data$Date = as.Date(data$Date, "%d/%m/%Y") 
data$Global_active_power = as.numeric(data$Global_active_power)

plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, file = "plot2.png")
dev.off()
