
hpc <- read.table('exdata_data_household_power_consumption/household_power_consumption.txt',sep=";",header=TRUE)
hpc <- subset(hpc,Date == '2/2/2007' | Date == '1/2/2007')
hpc$newdate <- paste(hpc$Date,hpc$Time)
hpc$newdate <- as.POSIXct(hpc$newdate,format="%d/%m/%Y %H:%M:%S")
hpc$Date <- strptime(hpc$Date,format='%d/%m/%Y')
hpc$Time <- strptime(hpc$Time,format='%H:%M:%S')
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
hpc$Global_reactive_power <- as.numeric(hpc$Global_reactive_power)
hpc$Voltage <- as.numeric(hpc$Voltage)
hpc$Global_intensity <- as.numeric(hpc$Global_intensity)
hpc$Sub_metering_1 <- as.numeric(hpc$Sub_metering_1)
hpc$Sub_metering_2 <- as.numeric(hpc$Sub_metering_2)

#plot1
par(mfrow=c(1,1))
with(hpc, hist(Global_active_power,binwidth=0.4,xlab = "Global Active Power (kilowatts)", ylab = "Frequency",main='Global Active Power',col="red"))
dev.copy(png,file='plot1.png')
dev.off()

#plot2
par(mfrow=c(1,1))
with(hpc, plot(newdate,Global_active_power,type='l',ylab = "Global Active Power (kilowatts)", xlab = "",main=""))
dev.copy(png,file='plot2.png')
dev.off()

#plot3
par(mfrow=c(1,1))
with(hpc, plot(newdate,Sub_metering_1,type='l',ylab = "Energy sub metering", xlab = "",main=""))
  with(hpc, points(newdate,Sub_metering_2,type='l',col='red'))
  with(hpc, points(newdate,Sub_metering_3,type='l',col='blue'))
  legend('topright',pch='-',col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.copy(png,file='plot3.png')
dev.off()
  
#plot4
par(mfrow=c(2,2))
with(hpc, plot(newdate,Global_active_power,type='l',ylab = "Global Active Power (kilowatts)", xlab = "",main=""))
with(hpc, plot(newdate,Voltage,type='l', xlab = "datetime",main=""))
with(hpc, plot(newdate,Sub_metering_1,type='l',ylab = "Energy sub metering", xlab = "",main=""))
  with(hpc, points(newdate,Sub_metering_2,type='l',col='red'))
  with(hpc, points(newdate,Sub_metering_3,type='l',col='blue'))
  legend('topright',pch='-',col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
with(hpc, plot(newdate,Global_reactive_power,type='l', xlab = "datetime",main=""))
dev.copy(png,file='plot4.png')
dev.off()