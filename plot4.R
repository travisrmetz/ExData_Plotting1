plot4<-function(filename="household_power_consumption.txt"){
        z<-read.table(filename,header=FALSE,sep=";",skip=66000,nrows=5000)
        z<-z[638:(638+2879),]
        rownames(z)<-1:2880
        y<-read.table(filename,header=TRUE,sep=";",nrows=3)
        listofcols<-colnames(y)
        colnames(z)<-listofcols
        z$DateTime<-paste(z$Date,z$Time,sep=" ")
        z$DateTime<-strptime(z$DateTime,"%d/%m/%Y %H:%M:%S")
        z<-z[,3:10]
        png("plot4.png",width=480, height=480)
        par(mfrow=c(2,2))
        with(z, plot(DateTime,Global_active_power,type="l",col="black",ylab="Global Active Power",xlab=""))
        with(z, plot(DateTime,Voltage,type="l",col="black",ylab="Voltage",xlab="datetime"))
        with(z, plot(DateTime,Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab=""))
        with(z,lines(DateTime, Sub_metering_2,type="l", col="red"))
        with(z,lines(DateTime, Sub_metering_3,type="l", col="blue"))
        x<-colnames(z)
        legend("topright",lwd=1,bty="n",pch="",col=c("black","red","blue"),legend=x[5:7])
        with(z, plot(DateTime,Global_reactive_power,type="l",col="black",ylab="Global_reactive_power",xlab="datetime"))
        dev.off()
}