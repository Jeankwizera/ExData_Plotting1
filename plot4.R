unzip("./household_power.zip")

library(data.table) ; library(dplyr)

# read and subset the data
household_power = fread("./household_power_consumption.txt")

household_power2 = household_power
household_power2$Date = as.Date(household_power2$Date, format = "%d/%m/%Y")

household_power2 =household_power2[Date>="2007-02-01" &  Date<="2007-02-02"]

# set space to print plots 2 by 2

png("plot4.png", 480,480)
par(mfrow = c(2,2))

# first plot
plot(household_power2$Date_Time, household_power2$Global_active_power, type = "l",xlab = "", ylab = "Global Active Power (kilowatts)" )

# second plot
datetime = household_power2$Date_Time
plot(datetime, household_power2$Voltage, ylab = "Voltage", xlab = "datetime", type = "l")

# third plot
  {
  plot(household_power2$Date_Time, household_power2$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
  lines(household_power2$Date_Time, household_power2$Sub_metering_2, col = "red", type = "l")
  lines(household_power2$Date_Time, household_power2$Sub_metering_3, col = "blue", type = "l")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
}

# fourth plot
plot(datetime, household_power2$Global_reactive_power, xlab = "datetime", ylab = "Global Active Power", type = "l")
dev.off()
