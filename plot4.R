raw <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", stringsAsFactor = FALSE)
set <- raw
set$Date <- as.Date(raw$Date,"%d/%m/%Y")

for (i in 3:9){
	set[[i]] <- as.numeric(raw[[i]])

}


boundary <- c("02/01/07","02/02/07")
boundary <- as.Date(boundary,"%m/%d/%y")


set1 <- set[set$Date>=boundary[1] & set$Date<=boundary[2],]
set1$DT<-strptime(paste(set1$Date,set1$Time),"%Y-%m-%d %H:%M:%S")
png(
	"plot4.png",
	width =480,
	height = 480,
	units = "px"
 )

par(mfcol=c(2,2))

plot(set1$DT,set1$Global_active_power,xlab = "",ylab="Global Active Power",type="l")


plot(set1$DT,set1$Sub_metering_1,xlab = "",ylab="Energy Sub Metering",type="l")
lines(set1$DT,set1$Sub_metering_2, col = "red")
lines(set1$DT,set1$Sub_metering_3, col = "blue")

legend("topright",legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=1,lwd=1, col = c("black","red","blue"),pch=c(NA,NA,NA),bty="n")

plot(set1$DT,set1$Voltage,xlab="datetime",ylab="Voltage",type="l")

plot(set1$DT,set1$Global_reactive_power,xlab = "datetime",ylab="Global Reactive Power",type="l")



dev.off()
