
rm(list = ls())

df <- read.table('household_power_consumption.txt', header = TRUE, sep = ";", na.strings = "?")
df <- subset(df, Date %in% c("1/2/2007", "2/2/2007"))

df$Datetime <- paste(df$Date, df$Time)
df$Datetime <- as.POSIXct(df$Datetime, format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png")
plot(df$Datetime, df$Global_active_power, type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
