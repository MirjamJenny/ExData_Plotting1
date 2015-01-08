#exploratory data analysis project 1

rm(list=ls(all=T))

setwd("/Users/jenny/Documents/Work no Dropbox/Git/ExData_Plotting1") #change this to wherever you've saved the data

data <- read.table(file="household_power_consumption.txt",header=T,sep=";",na.strings="?")
data <- as.data.frame(data)

dat <- as.Date(data$Date,"%d/%m/%Y")
data[,1] <- dat

indexx <- data$Date=="2007-02-01" | data$Date=="2007-02-02"

indexdata <- data[indexx,]

timedate <- array(NA,dim(indexdata)[1])
for (i in 1:dim(indexdata)[1]) {
        timedate[i] <- paste(indexdata$Date[i],indexdata$Time[i])
}
        
tim <- strptime(timedate,format="%Y-%m-%d %H:%M:%S")
        
indexdata <- cbind(tim,indexdata)

weekday <- weekdays(tim)

#plot1
png(filename = "plot1.png",
    width = 480, height = 480, units = "px")

hist(indexdata$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

dev.off()
