plot4 <- function(){
    ### Read data

    data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character", na.strings = "?")

    ### Set field Date as datatype Date
    data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

    ### Filter from the dates 2007-02-01 and 2007-02-02
    data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

    ### Set field DateTime
    data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")

    ### Set fields as datatype Numeric
    data$Global_active_power <- as.numeric(data$Global_active_power)
    data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
	data$Voltage <- as.numeric(data$Voltage)
	data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
    data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
    data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

    #### Open a PNG file
    png("plot4.png", width = 480, height = 480)

    ### Set 2 x 2
    par("mfrow" = c (2, 2))

    ### Making Plot 1
    plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

    ### Making Plot 2
    plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

    ### Making Plot 3
    plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(data$DateTime, data$Sub_metering_2, col = "red")
    lines(data$DateTime, data$Sub_metering_3, col = "blue")
    legend("topright", lty = c(1, 1, 1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))

    ### Making Plot 4
    plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

    ### Close the PNG file
    dev.off()

}
