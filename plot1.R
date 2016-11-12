# This function reads household_power_consumption.txt and creates a histogram for Global_active_power for 2 days
# It assumes the file household_power_consumption.txt e present in the working directory

plot1<-function(){
        print("Reading the file...")
        power_data<-read.csv2("household_power_consumption.txt",na.strings ="?")
        print("Subsetting...")
        power_data_feb2007<-subset(power_data,power_data$Date=="1/2/2007" | power_data$Date=="2/2/2007")
        print("Plotting")
        png("plot1.png", width=480, height=480)
        hist(as.numeric(as.character(sub("," , ".", power_data_feb2007$Global_active_power))),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
        dev.off()
        print("Done! Plot was saved to file: plot1.png")
        
}