#Download data
temp<-tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data<-read.table(unz(temp,"household_power_consumption.txt"), sep=";", header=TRUE, na.strings="?")
unlink(temp)

#Format date and time
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data$Time2<-strptime(data$Time,"%H:%M:%S")
dataSm <-subset(data,Date=="2007-02-01" | Date=="2007-02-02")
dataSm$datetime<-as.POSIXct(paste(dataSm$Date, dataSm$Time), format = "%Y-%m-%d %H:%M:%S")

#Initiate PNG file to save plot to
png(filename="C:/Users/EMcConnell/Documents/GitHub/ExData_Plotting1/plot2.png", width=480, height=480)
plot(dataSm$Global_active_power~dataSm$datetime, type="l",ylab="Global Active Power (kilowatts)",xlab=NA)
dev.off()


