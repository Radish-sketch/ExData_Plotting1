# read two days data for the subset generated same as in plot1.R, skip it if data1 is already exist
# the files are already downloaded and unziped in plot1.R

testdata<-read.table(".\\household_power_consumption.txt",sep=";",
                     header=TRUE,nrows=5)
names(testdata)

s1<-grep("[1-2]/2/2007", readLines(".\\household_power_consumption.txt"))

N_rows=length(s1)

data<-read.table(".\\household_power_consumption.txt",sep=";",
                 header=TRUE, skip=s1[1]-3, nrows=N_rows+1)
names(data)<-names(testdata)


data1<-data[data[,1]=="1/2/2007"|data[,1]=="2/2/2007",]



# can skip the code above if plot1.R is already run once



data1$Date<-as.Date(data1$Date,tryFormats = c("%d/%m/%Y"))

library(lubridate)
x<-with(data1, ymd(Date) + hms(Time)) # x is the time axis

# plot4.PNG file with a width of 480 pixels and a height of 480 pixels

png(file="plot4.PNG",width=480, height=480)

# plot Global Active Power
par(mfrow=c(2,2))
par(mar=c(5,4,4,2))

plot(x,data1$Global_active_power,
     type="l", col="black",
     ylab="Global active power",
     xlab="",
     main=NULL
     )

plot(x,data1$Voltage,
     type="l", col="black",
     ylab="Voltage",
     xlab="datetime",
     main=NULL
)


plot(x,data1$Sub_metering_1,type="l",
     ylab="Energy sub metering",
     xlab="",
)
points(x,data1$Sub_metering_2,type="l",col="red")
points(x,data1$Sub_metering_3,type="l",col="blue")
legend("topright", col=c("black","red",blue), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n" )

plot(x,data1$Global_reactive_power,type="l",xlab="datetime")


dev.off()
