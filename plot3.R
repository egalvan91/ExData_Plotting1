plot3 <- function(){
    ### Read data

    data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character", na.strings = "?")

    ### Set field Date as datatype Date
    data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

    ### Filter from the dates 2007-02-01 and 2007-02-02
    data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

    ### Set field DateTime
    data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")

    ### Set fields as datatype Numeric
    data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
    data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
    data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
	
    #### Open a PNG file
    png("plot3.png", width = 480, height = 480)

    ### Making Plots
    plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(data$DateTime, data$Sub_metering_2, col = "red")
    lines(data$DateTime, data$Sub_metering_3, col = "blue")
    legend("topright", lty = c(1, 1, 1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))

    ### Close the PNG file
    dev.off()

}
