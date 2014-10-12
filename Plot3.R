library(sqldf)

hpc <- read.csv.sql("~/household_power_consumption.txt", sql = "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007' ", sep = ";", header = TRUE)

hpc$Date1 <- as.Date(hpc$Date, "%d/%m/%Y")

hpc$Week<-weekdays(hpc$Date1)

hpc$dt<-as.POSIXct(paste(hpc$Date1, hpc$Time), format="%Y-%m-%d %H:%M:%S")

png("Plot3.png", width = 480, height = 480)
plot(hpc$dt,hpc$Sub_metering_1, type = "l",ylab = "Energy sub metering", xlab = "")
lines(hpc$dt,hpc$Sub_metering_1, col = "black", lty = 1)
lines(hpc$dt,hpc$Sub_metering_2, col = "red", lty = 1)
lines(hpc$dt,hpc$Sub_metering_3, col = "blue", lty = 1)
legend('topright', legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty = c(1,1,1), col = c('black', 'red', 'blue') )
dev.off()

