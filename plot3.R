generate_plot3<-function()
{
    filename <- "household_power_consumption.zip"
    #Data source: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
    ## Download and unzip the dataset:
    if (!file.exists(filename)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileURL, filename, method="curl")
    }  
    if (!file.exists("household_power_consumption.txt")) { 
        unzip(filename) 
    }
    df <- read.table("household_power_consumption.txt",
                     header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
    subSetDf <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]
    datetime <- strptime(paste(subSetDf$Date, subSetDf$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
    globalActivePower <- as.numeric(subSetDf$Global_active_power)
    subMetering1 <- as.numeric(subSetDf$Sub_metering_1)
    subMetering2 <- as.numeric(subSetDf$Sub_metering_2)
    subMetering3 <- as.numeric(subSetDf$Sub_metering_3)
    
    png("plot3.png", width=480, height=480)
    plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
    lines(datetime, subMetering2, type="l", col="red")
    lines(datetime, subMetering3, type="l", col="blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
    dev.off()
}