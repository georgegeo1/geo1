#load data
household_power_consumption <- read.csv("C:/Users/pc/Desktop/household_power_consumption.txt", sep=";")

#format date
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")

#create subset of data
subset <- subset(household_power_consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#plot histogram
hist(subset$Global_active_power, main="Global Active Power", xlab="Global Active Power (KWs)", ylab="Frequency", col="Red")

#create png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()