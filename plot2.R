plot2<-function(){
        print("Reading the file...")
        power_data<-read.csv2("household_power_consumption.txt",na.strings ="?")
        print("Preparing...")
        power_data_feb2007<-subset(power_data,power_data$Date=="1/2/2007" | power_data$Date=="2/2/2007")
        my_dates <- as.POSIXct(strptime(paste(power_data_feb2007$Date,power_data_feb2007$Time,sep=" "),"%d/%m/%Y %H:%M:%S",tz="America/Los_Angeles"))
        print("Plotting")
        png("plot2.png", width=480, height=480)
        plot(as.numeric(as.character(sub("," , ".", power_data_feb2007$Global_active_power))) ~ my_dates, type="l", xlab="",ylab="Global Active Power (kilowatts)") #       png("plot1.png", width=480, height=480
        dev.off()
        print("Done! Plot was saved to file: plot2.png")
                               
}