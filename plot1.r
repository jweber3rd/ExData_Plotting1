# Read table text file as table and store into variable
hpc<-read.table("household_power_consumption.txt",sep=";",header=TRUE)

# Convert and save Global_active_power as numeric values
gap<-as.numeric(hpc$Global_active_power)

# Construct histogram
hist(gap,main="Global Active Power",ylab="Frequency",xlab="Global Active Power (kilowatts)",col="red")

# Copy histogram as png file
dev.copy(png,filename="plot1.png",width=480,height=480)

dev.off()