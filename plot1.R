raw <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", stringsAsFactor = FALSE)
set <- raw
set$Date <- as.Date(raw$Date,"%d/%m/%Y")

for (i in 3:9){
	set[[i]] <- as.numeric(raw[[i]])

}

boundary <- c("02/01/07","02/02/07")
boundary <- as.Date(c,"%m/%d/%y")


set1 <- set[set$Date>=boundary[1] & set$Date<=boundary[2],]

png(
	"plot1.png",
	width =480,
	height = 480,
	units = "px"
 )
hist(set1$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", ylab="Frequency", main = "Global Active Power")


dev.off()
