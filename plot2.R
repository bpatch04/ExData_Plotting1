
hpc <- read.table('exdata_data_household_power_consumption/household_power_consumption.txt',sep=";",header=TRUE)
hpc <- subset(hpc,Date == '2/2/2007' | Date == '1/2/2007')
hpc$newdate <- paste(hpc$Date,hpc$Time)
hpc$newdate <- as.POSIXct(hpc$newdate,format="%d/%m/%Y %H:%M:%S")
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)

#plot2
par(mfrow=c(1,1))
with(hpc, plot(newdate,Global_active_power,type='l',ylab = "Global Active Power (kilowatts)", xlab = "",main=""))
dev.copy(png,file='plot2.png')
dev.off()
