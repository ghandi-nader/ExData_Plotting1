d = read.table("household_power_consumption.txt",sep=";",header = TRUE,fill=FALSE,strip.white=TRUE)
d$Date2 <- as.Date( as.character(d$Date), "%d/%m/%Y")
d$Datetime2 <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")
x <- subset(d, Date2 >= "2007-02-01" &  Date2 <= "2007-02-02" )
x$sb1<-as.numeric(as.character(x$Sub_metering_1))
x$sb2<-as.numeric(as.character(x$Sub_metering_2))
x$sb3<-as.numeric(as.character(x$Sub_metering_3))
png(filename="plot3.png",width=480, height=480,units = "px")
plot(x$Datetime2,x$sb1,type="l",xlab="", ylab="Energy sub metering")
lines(x$Datetime2,x$sb2,col="red")
lines(x$Datetime2,x$sb3,col="blue")
legend('topright', legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black","red", "blue"),lwd=c(2,2,2))
dev.off()