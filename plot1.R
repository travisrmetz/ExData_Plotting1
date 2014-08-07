plot1<-function(filename="household_power_consumption.txt"){
        z<-read.table(filename,header=FALSE,sep=";",skip=66000,nrows=5000)
        z<-z[638:(638+2879),]
        rownames(z)<-1:2880
        y<-read.table(filename,header=TRUE,sep=";",nrows=3)
        listofcols<-colnames(y)
        colnames(z)<-listofcols
        z$DateTime<-paste(z$Date,z$Time,sep=" ")
        z$DateTime<-strptime(z$DateTime,"%d/%m/%Y %H:%M:%S")
        z<-z[,3:10]
        png("plot1.png",width=480, height=480)
        with(z, hist(Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power"))
        dev.off()

}