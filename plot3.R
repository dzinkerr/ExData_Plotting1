##READING DATA
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")

unzip(zipfile="./data/Dataset.zip",exdir="./data")

data <- read.csv("./data/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")
dataFinal <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

##THIRD PLOT
time<-as.POSIXct(paste(as.Date(dataFinal$Date,format="%d/%m/%Y"),dataFinal$Time))
with(dataFinal, {
    plot(Sub_metering_1~time, type="l",ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~time,col='Red')
    lines(Sub_metering_3~time,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", 
                                                                         "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()