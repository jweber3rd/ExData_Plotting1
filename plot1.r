# Read text file and store into variable
df<-read.csv("household_power_consumption.txt",sep=";",header=TRUE)

# Convert date and time
my_date = as.POSIXlt(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

# Subset dataframe to include only needed dates
hpc<-subset(df,as.Date(my_date)>=as.Date("2007-02-01") & as.Date(my_date)<=as.Date("2007-02-02"))

# Convert and save Global_active_power as numeric values
gap<-as.numeric(hpc$Global_active_power)

# Construct histogram
hist(gap,main="Global Active Power",ylab="Frequency",xlab="Global Active Power (kilowatts)",col="red")

# Copy histogram as png file
dev.copy(png,filename="plot1.png",width=480,height=480)

dev.off()