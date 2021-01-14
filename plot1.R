
rm(list = ls())

df <- read.table('household_power_consumption.txt', header = TRUE, sep = ";", na.strings = "?")
df <- subset(df, Date %in% c("1/2/2007", "2/2/2007"))

df$Datetime <- paste(df$Date, df$Time)
df$Datetime <- as.POSIXct(df$Datetime, format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot1.png")
hist(df$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()
