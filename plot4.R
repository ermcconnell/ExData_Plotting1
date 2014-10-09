#Download data
temp<-tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data<-read.table(unz(temp,"household_power_consumption.txt"), sep=";", header=TRUE, na.strings="?")
unlink(temp)

#Reformat date and time
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data$Time2<-strptime(data$Time,"%H:%M:%S")
dataSm <-subset(data,Date=="2007-02-01" | Date=="2007-02-02")
dataSm$datetime<-as.POSIXct(paste(dataSm$Date, dataSm$Time), format = "%Y-%m-%d %H:%M:%S")

#Initiate PNG file I want to plot to
png(filename="C:/Users/EMcConnell/Documents/GitHub/ExData_Plotting1/plot4.png", width=480, height=480)

#Set plot to be four by four
par(mfrow=c(2,2))

#First graph
plot(dataSm$Global_active_power~dataSm$datetime, type="l",ylab="Global Active Power",xlab=NA)

#Second graph
plot(dataSm$Voltage~dataSm$datetime, type="l",ylab="Voltage",xlab="datetime")

#Third graph
plot(dataSm$Sub_metering_1~dataSm$datetime, type="l",ylab="Energy sub metering",xlab=NA)
lines(dataSm$datetime,dataSm$Sub_metering_2,col="red")
lines(dataSm$datetime,dataSm$Sub_metering_3,col="blue")
Leg<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend(x="topright",legend=Leg, col=c("black","red","blue"), lty=c(1,1,1),bty="n")

#Fourth graph
plot(dataSm$Global_reactive_power~dataSm$datetime, type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()
