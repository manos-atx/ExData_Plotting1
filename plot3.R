
rm(list = ls())

df <- read.table('household_power_consumption.txt', header = TRUE, sep = ";", na.strings = "?")
df <- subset(df, Date %in% c("1/2/2007", "2/2/2007"))

df$Datetime <- paste(df$Date, df$Time)
df$Datetime <- as.POSIXct(df$Datetime, format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png")
plot(df$Datetime, df$Sub_metering_1, type = "l", lty = 1, xlab = "", ylab = "Energy sub metering")
lines(df$Datetime, df$Sub_metering_2, col = "red")
lines(df$Datetime, df$Sub_metering_3, col = "blue")
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()

# sub_metering <- with(df, matrix(data = c(Sub_metering_1, Sub_metering_2, Sub_metering_3), ncol = 3, byrow = FALSE))
# matplot(df$Datetime, sub_metering, type = "l", lty = 1, col = c("black", "red", "blue"),
#         xlab = "",
#         ylab = "Energy sub metering")
     