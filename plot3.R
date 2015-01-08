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


#plot3
png(filename = "plot3.png",
    width = 480, height = 480, units = "px")

plot(as.numeric(indexdata$Sub_metering_1),type="l",axes=F,xlab="",ylab="Energy sub metering",ylim=c(0,40))
lines(indexdata$Sub_metering_2,col="red")
lines(indexdata$Sub_metering_3,col="blue")
box()
axis(1,at=c(1,1450,2900),labels=c("Thu","Fri","Sat"))
axis(2,at=c(0,10,20,30))
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)

dev.off()
