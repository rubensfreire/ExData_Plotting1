plot4<-function(){
        print("Reading the file...")
        power_data<-read.csv2("household_power_consumption.txt",na.strings ="?")
        print("Preparing...")
        power_data_feb2007<-subset(power_data,power_data$Date=="1/2/2007" | power_data$Date=="2/2/2007")
        my_dates <- as.POSIXct(strptime(paste(power_data_feb2007$Date,power_data_feb2007$Time,sep=" "),"%d/%m/%Y %H:%M:%S"))
        print("Plotting")
        png("plot4.png", width=480, height=480)
        
        # Set to 4 graphs in the plot
        par(mfrow=c(2,2))
        # Plot Global_active_power
        plot(as.numeric(as.character(sub("," , ".", power_data_feb2007$Global_active_power))) ~ my_dates, type="l", xlab="",ylab="Global Active Power") 
        
        # Plot Voltage
        plot(as.numeric(as.character(sub("," , ".", power_data_feb2007$Voltage))) ~ my_dates, type="l", xlab="datetime",ylab="Voltage")
       
        # Plot Sub_meterings and legend
        plot(as.numeric(as.character(sub("," , ".", power_data_feb2007$Sub_metering_1))) ~ my_dates, type="l", xlab="",ylab="Energy sub metering") 
        lines(as.numeric(as.character(sub("," , ".", power_data_feb2007$Sub_metering_2))) ~ my_dates, type="l", xlab="", col="red")
        lines(as.numeric(as.character(sub("," , ".", power_data_feb2007$Sub_metering_3))) ~ my_dates, type="l", xlab="", col="blue")
        legend("topright" ,lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1            ","Sub_metering_2","Sub_metering_3"),cex=.7,bty="n")

        # Plot Global_reactive_power
        plot(as.numeric(as.character(sub("," , ".", power_data_feb2007$Global_reactive_power))) ~ my_dates, type="l", xlab="datetime",ylab="Global_reactive_power")
     
           dev.off()
        print("Done! Plot was saved to file: plot4.png")
                               
}