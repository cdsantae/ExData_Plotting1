#Preparing dataset for plots
setwd(".../Exploratory Data Analysis/Course Project 1")

#Read original Data
data<-read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactors=F)

#Change data class of the variables
data$Date<-strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Global_reactive_power<-as.numeric(data$Global_reactive_power)
data$Voltage<-as.numeric(data$Voltage)   
data$Global_intensity<-as.numeric(data$Global_intensity)
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)

#Create the subdata
HPC<-subset(data,Date<"2007-02-03")
HPC<-subset(HPC,Date>="2007-02-01")

#Remove the original data
rm(data)

#Create the fourth Plot
library(png)
attach(HPC)
png("Plot4.png",width=480,height=480)

#preparing multiple plot
par(mfrow=c(2,2))

#Plot 1
plot(Date,Global_active_power,type='l',xlab='',ylab="Global Active Power (kilowatts)")

#Plot 2
plot(Date,Voltage,type='l',xlab='datetime',ylab='Voltage')

#Plot3
plot(Date,Sub_metering_1,type='l',xlab='',ylab='Energy sub metering')
lines(Date,Sub_metering_2,col=2)
lines(Date,Sub_metering_3,col=4)
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c(1,2,4),bty="n",cex=0.8)

#Plot4
plot(Date,Global_reactive_power,type='l',xlab='datetime',ylab="Global_reactive_power")
dev.off()
