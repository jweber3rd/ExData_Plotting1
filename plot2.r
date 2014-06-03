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

# Construct line plot with no x-axis label
plot(gap ~ my_date, type="l",ylab="Global Active Power (kilowatts)",xlab=" ",xaxt="n")

# Construct x-axis label
axis(side = 1, at = c(my_date[1],my_date[length(my_date)/2],my_date[length(my_date)]), labels= c("Thu","Fri","Sat"))

# Copy graph as png file
dev.copy(png,filename="plot2.png",width=480,height=480)

dev.off()