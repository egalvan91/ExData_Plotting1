plot1 <- function(){
    ### Read data

    data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")

    ### Set field Date as datatype Date
    data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

    ### Filter from the dates 2007-02-01 and 2007-02-02
    data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

    ### Set field Global_active_power as datatype Numeric
    data$Global_active_power <- as.numeric(data$Global_active_power)

    #### Open a PNG file
    png("plot1.png", width = 480, height = 480)

    ### Making Plots
    hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

    ### Close the PNG file
    dev.off()

}
