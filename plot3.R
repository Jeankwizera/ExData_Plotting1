unzip("./household_power.zip")

library(data.table) ; library(dplyr)

# read and subset the data
household_power = fread("./household_power_consumption.txt")

household_power2 = household_power
household_power2$Date = as.Date(household_power2$Date, format = "%d/%m/%Y")

household_power2 =household_power2[Date>="2007-02-01" &  Date<="2007-02-02"]

#convert sub metering columns to numeric
household_power2$Sub_metering_1 = as.numeric(household_power2$Sub_metering_1)
household_power2$Sub_metering_2= as.numeric(household_power2$Sub_metering_2)
household_power2$Sub_metering_3 = as.numeric(household_power2$Sub_metering_3)

# merge date and time
household_power2$Date_Time = as.POSIXct(paste(household_power2$Date, household_power2$Time), format = "%Y-%m-%d %H:%M:%S")

# plot 3

png("plot3.png", 480,480)
plot(household_power2$Date_Time, household_power2$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(household_power2$Date_Time, household_power2$Sub_metering_2, col = "red", type = "l")
lines(household_power2$Date_Time, household_power2$Sub_metering_3, col = "blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.off()
