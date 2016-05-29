
generate_plot2<-function()
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
    png("plot2.png", width=480, height=480)
    plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    dev.off() 
}