unzip("./household_power.zip")

library(data.table) ; library(dplyr)

# read and subset the data
household_power = fread("./household_power_consumption.txt")

household_power2 = household_power
household_power2$Date = as.Date(household_power2$Date, format = "%d/%m/%Y")

household_power2 =household_power2[Date>="2007-02-01" &  Date<="2007-02-02"]
household_power2$Global_active_power = as.numeric(household_power2$Global_active_power)

# merge date and time
household_power2$Date_Time = as.POSIXct(paste(household_power2$Date, household_power2$Time), format = "%Y-%m-%d %H:%M:%S")

# plot global active power against day

png("plot2.png", 480,480)
plot(household_power2$Date_Time, household_power2$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)" )
dev.off()
