unzip("./household_power.zip")

library(data.table) ; library(dplyr)

# read and subset the data
household_power = fread("./household_power_consumption.txt")

household_power2 = household_power
household_power2$Date = as.Date(household_power2$Date, format = "%d/%m/%Y")

household_power2 =household_power2  [Date>="2007-02-01" & Date<="2007-02-02"]
household_power2$Global_active_power = as.numeric(household_power2$Global_active_power)

# histogram of global active power

png ("plot1.png", width = 480, height = 480)
hist(household_power2$Global_active_power, col = "orange", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
