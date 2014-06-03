# Read text file and store into variable
df<-read.csv("household_power_consumption.txt",sep=";",header=TRUE)

# Convert date and time
my_date = as.POSIXlt(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

# Subset dataframe to include only needed dates
hpc<-subset(df,as.Date(my_date)>=as.Date("2007-02-01") & as.Date(my_date)<=as.Date("2007-02-02"))

# Convert date and time to numeric values
my_date<-as.numeric(my_date)

# Store the three sub metering variables as numeric vectors
sm1<-as.numeric(hpc$Sub_metering_1)
sm2<-as.numeric(hpc$Sub_metering_2)
sm3<-as.numeric(hpc$Sub_metering_3)

# Construct line plot for first sub metering variable with no x-axis label
plot(sm1 ~ my_date, type="l",ylab="Energy sub metering",xlab=" ",xaxt="n")
+lines(sm2 ~ my_date, type="l",col="red") # Add the line plot for the second sub metering variable
+lines(sm3 ~ my_date, type="l",col="blue") # Add the line plot for the third sub metering variable

# Construct x-axis label
axis(side = 1, at = c(my_date[1],my_date[length(my_date)/2],my_date[length(my_date)]), labels= c("Thu","Fri","Sat"))

# Construct legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","Red","Blue"),lty=c(1,1),xjust=1,text.width=60000)

# Copy graph as png file
dev.copy(png,filename="plot3.png",width=480,height=480)

dev.off()