# Read table text file as table and store into variable
hpc<-read.table("household_power_consumption.txt",sep=";",header=TRUE)

# Convert and save Global_active_power as numeric values
gap<-as.numeric(hpc$Global_active_power)

# Convert date and time
my_date = as.POSIXlt(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")

# Convert date and time to numeric values
my_date<-as.numeric(my_date)

# Construct line plot with no x-axis label
plot(gap ~ my_date, type="l",ylab="Global Active Power (kilowatts)",xlab=" ",xaxt="n")

# Construct x-axis label
axis(side = 1, at = c(my_date[1],my_date[length(my_date)/2],my_date[length(my_date)]), labels= c("Thu","Fri","Sat"))

# Copy graph as png file
dev.copy(png,filename="plot2.png",width=480,height=480)

dev.off()