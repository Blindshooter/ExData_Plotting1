library(sqldf)

hpc <- read.csv.sql("~/household_power_consumption.txt", sql = "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007' ", sep = ";", header = TRUE)

hpc$Date1 <- as.Date(hpc$Date, "%d/%m/%Y")

hpc$Week<-weekdays(hpc$Date1)

hpc$dt<-as.POSIXct(paste(hpc$Date1, hpc$Time), format="%Y-%m-%d %H:%M:%S")

png("Plot2.png", width = 480, height = 480)

plot(hpc$dt, hpc$Global_active_power, pch = '.', ylab = 'Global Active Power (kilowatts)', type = 'l',  xlab ='')
lines(hpc$dt, hpc$Global_active_power)
dev.off()