#Download Data
temp<-tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data<-read.table(unz(temp,"household_power_consumption.txt"), sep=";", header=TRUE, na.strings="?")
unlink(temp)

#Format date and time, exclude uncessary dates
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data$Time<-strptime(data$Time,"%H:%M:%S")
dataSm<-subset(data,Date=="2007-02-01" | Date=="2007-02-02")

#Initiate the PNG file I want to plot to
png(filename="C:/Users/EMcConnell/Documents/GitHub/ExData_Plotting1/plot1.png", width=480, height=480)
hist(dataSm$Global_active_power, col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
