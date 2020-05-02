##READING DATA
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")

unzip(zipfile="./data/Dataset.zip",exdir="./data")

data <- read.csv("./data/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")
dataFinal <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

##FOURTH PLT
time<-as.POSIXct(paste(as.Date(dataFinal$Date,format="%d/%m/%Y"),dataFinal$Time))
par(mfrow=c(2,2), mar=c(4,4,2,0.5),oma=c(0,0,0,0))
with(dataFinal, {
    plot(Global_active_power~time, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~time, type="l", ylab="Voltage (volt)", xlab="datetime")
    ##Same as third plot
    plot(Sub_metering_1~time, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~time,col='Red')
    lines(Sub_metering_3~time,col='Blue')
    legend("topright", col=c("black", "red", "blue"),
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 2:2,
           x.intersp = 0.01,y.intersp = 0.5,cex=0.8,adj=-0.09)
    plot(Global_reactive_power~time, type="l", 
         ylab="Global Rective Power (kilowatts)",xlab="datetime")
})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()