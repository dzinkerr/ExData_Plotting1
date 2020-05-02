##READING DATA
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")

unzip(zipfile="./data/Dataset.zip",exdir="./data")

data <- read.csv("./data/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")
dataFinal <- subset(data, Date %in% c("1/2/2007","2/2/2007"))


##FIRST PLOT
hist(dataFinal$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)",
     ylab="Frequency", col="Red")

dev.copy(png,file="plot1.png", width=480, height=480)
dev.off()
