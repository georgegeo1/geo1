#load data
household_power_consumption <- read.csv("C:/Users/pc/Desktop/household_power_consumption.txt", sep=";")

#format date
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")

#create subset of data
subset <- subset(household_power_consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#convert date and time
datetime <- paste(as.Date(subset$Date), subset$Time)
subset$Datetime <- as.POSIXct(datetime)

#create plot
plot(subset$Global_active_power~subset$Datetime, type="l", ylab="Global Active Power (KWs)", xlab="")

#create png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()