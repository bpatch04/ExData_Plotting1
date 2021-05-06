
hpc <- read.table('exdata_data_household_power_consumption/household_power_consumption.txt',sep=";",header=TRUE)
hpc <- subset(hpc,Date == '2/2/2007' | Date == '1/2/2007')
hpc$newdate <- paste(hpc$Date,hpc$Time)
hpc$newdate <- as.POSIXct(hpc$newdate,format="%d/%m/%Y %H:%M:%S")
hpc$Sub_metering_1 <- as.numeric(hpc$Sub_metering_1)
hpc$Sub_metering_2 <- as.numeric(hpc$Sub_metering_2)
hpc$Sub_metering_3 <- as.numeric(hpc$Sub_metering_3)

#plot3
par(mfrow=c(1,1))
with(hpc, plot(newdate,Sub_metering_1,type='l',ylab = "Energy sub metering", xlab = "",main=""))
with(hpc, points(newdate,Sub_metering_2,type='l',col='red'))
with(hpc, points(newdate,Sub_metering_3,type='l',col='blue'))
legend('topright',pch='-',col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.copy(png,file='plot3.png')
dev.off()