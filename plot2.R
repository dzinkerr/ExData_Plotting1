##READING DATA
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")

unzip(zipfile="./data/Dataset.zip",exdir="./data")

data <- read.csv("./data/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")
dataFinal <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

##SECOND PLT
time<-as.POSIXct(paste(as.Date(dataFinal$Date,format="%d/%m/%Y"),dataFinal$Time))
with(dataFinal, {plot(Global_active_power~time, type="l",ylab="Global Active Power (kilowatts)",
                      xlab="")})

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()