



# Download and unzip the files

fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile = ".\\Epower consumption.zip",mode='wb',cacheOK = FALSE)

unzip("Epower consumption.zip",exdir=getwd())


# Read data from the dates 2007-02-01 and 2007-02-02. read a few more lines then subset

testdata<-read.table(".\\household_power_consumption.txt",sep=";",header=TRUE,nrows=10)
names(testdata)

s1<-grep("[1-2]/2/2007", readLines(".\\household_power_consumption.txt"))

N_rows=length(s1)

data<-read.table(".\\household_power_consumption.txt",sep=";",
                 header=TRUE, skip=s1[1]-3, nrows=N_rows+1)
names(data)<-names(testdata)


data1<-data[data[,1]=="1/2/2007"|data[,1]=="2/2/2007",]

# data1$Date<-as.Date(data1$Date,tryFormats = c("%d/%m/%Y"))

# Save the data to file so that don't need to download again or check again

# write.table(data1,".\\two_days_data.txt", sep=";" ,row.names=FALSE)



# plot1.PNG file with a width of 480 pixels and a height of 480 pixels

png(file="plot1.PNG",width=480, height=480)

# plot Global Active Power

hist(data1$Global_active_power,col="red",
     xlab="Glowbal Active Power (kilowatts)",
     main="Glowbal Active Power")

dev.off()