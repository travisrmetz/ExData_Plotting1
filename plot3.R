plot3<-function(filename="household_power_consumption.txt"){
        z<-read.table(filename,header=FALSE,sep=";",skip=66000,nrows=5000)
        z<-z[638:(638+2879),]
        rownames(z)<-1:2880
        y<-read.table(filename,header=TRUE,sep=";",nrows=3)
        listofcols<-colnames(y)
        colnames(z)<-listofcols
        z$DateTime<-paste(z$Date,z$Time,sep=" ")
        z$DateTime<-strptime(z$DateTime,"%d/%m/%Y %H:%M:%S")
        z<-z[,3:10]
        png("plot3.png",width=480, height=480)
        with(z, plot(DateTime,Sub_metering_1,type="l",col="black",ylab="Energy Sub Metering",xlab=""))
        with(z,lines(DateTime, Sub_metering_2,type="l", col="red"))
        with(z,lines(DateTime, Sub_metering_3,type="l", col="blue"))
        x<-colnames(z)
        legend("topright",lwd=1,pch="",col=c("black","red","blue"),legend=x[5:7])
        dev.off()
}