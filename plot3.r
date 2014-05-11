plot3 <- function() {

	pdata <- read.table(file = "household_power_consumption.txt", sep = ";", skip = 66638,nrows = 2880)


	colnames(pdata) <- c("Date","Time","Global_active_power",
	"Global_reactive_power","Voltage","Global_intensity",
	"Sub_metering_1","Sub_metering_2","Sub_metering_3")

	png(filename = "plot3.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")

	datetime <- strptime(paste(pdata$Date, pdata$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
	plot(datetime, pdata$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")
	lines(datetime, pdata$Sub_metering_2, type="l", col="red")
	lines(datetime, pdata$Sub_metering_3, type="l", col="blue")

	legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black",  "red", "blue"))
	
	dev.off()	

}