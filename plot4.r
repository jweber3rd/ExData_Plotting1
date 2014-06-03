# Read text file and store into variable
df<-read.csv("household_power_consumption.txt",sep=";",header=TRUE)

# Convert date and time
my_date = as.POSIXlt(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

# Subset dataframe to include only needed dates
hpc<-subset(df,as.Date(my_date)>=as.Date("2007-02-01") & as.Date(my_date)<=as.Date("2007-02-02"))

# Convert and save Global_active_power as numeric values
gap<-as.numeric(hpc$Global_active_power)

# Convert date and time to numeric values
my_date<-as.numeric(my_date)

# Convert and save Global_active_power as numeric values
gap<-as.numeric(hpc$Global_active_power)

# Convert and save voltage as numeric values
voltage<-as.numeric(hpc$Voltage)

# Store the three sub metering variables as numeric vectors
sm1<-as.numeric(hpc$Sub_metering_1)
sm2<-as.numeric(hpc$Sub_metering_2)
sm3<-as.numeric(hpc$Sub_metering_3)

#Convert and save global reactive power as numeric values
grp<-as.numeric(hpc$Global_reactive_power)

# Setup output for the four plots
par(mfrow=c(2,2))

# Plot 1
plot(gap ~ my_date, type="l",ylab="Global Active Power (kilowatts)",xlab=" ",xaxt="n")

# x-axis label for plot1
axis(side = 1, at = c(my_date[1],my_date[length(my_date)/2],my_date[length(my_date)]), labels= c("Thu","Fri","Sat"))

# Plot 2
plot(voltage ~ my_date, type="l",ylab="Voltage",xaxt="n",xlab="datetime")

# x-axis label for plot2
axis(side = 1, at = c(my_date[1],my_date[length(my_date)/2],my_date[length(my_date)]), labels= c("Thu","Fri","Sat"))

# Plot 3
plot(sm1 ~ my_date, type="l",ylab="Energy sub metering",xlab=" ",xaxt="n")
+lines(sm2 ~ my_date, type="l",col="red")
+lines(sm3 ~ my_date, type="l",col="blue")

# x-axis label for plot3
axis(side = 1, at = c(my_date[1],my_date[length(my_date)/2],my_date[length(my_date)]), labels= c("Thu","Fri","Sat"))

# Legend for plot3
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","Red","Blue"),lty=c(1,1),xjust=1,text.width=85000,cex=0.7,y.intersp=0.8,bty="n")

# Plot 4
plot(grp ~ my_date, type="l",ylab="Global_reactive_power",xaxt="n",xlab="datetime")

# x-axis label for plot4
axis(side = 1, at = c(my_date[1],my_date[length(my_date)/2],my_date[length(my_date)]), labels= c("Thu","Fri","Sat"))

# Copy graphs as png file
dev.copy(png,filename="plot4.png",width=480,height=480)

dev.off()