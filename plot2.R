# read two days data for the subset generated same as in plot1.R, skip it if data1 is already exist
# the files are already downloaded and unzip

testdata<-read.table(".\\household_power_consumption.txt",sep=";",header=TRUE,nrows=5)
names(testdata)

s1<-grep("[1-2]/2/2007", readLines(".\\household_power_consumption.txt"))

N_rows=length(s1)

data<-read.table(".\\household_power_consumption.txt",sep=";",
                 header=TRUE, skip=s1[1]-3, nrows=N_rows+1)
names(data)<-names(testdata)


data1<-data[data[,1]=="1/2/2007"|data[,1]=="2/2/2007",]



# can skip the code above if plot1.R is already run once

data2<-data1
data2$Date<-as.Date(data2$Date,tryFormats = c("%d/%m/%Y"))