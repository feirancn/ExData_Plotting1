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
	"plot2.png",
	width =480,
	height = 480,
	units = "px"
 )


plot(set1$DT,set1$Global_active_power,xlab = "",ylab="Global Active Power (kilowatts)",type="l")


dev.off()
