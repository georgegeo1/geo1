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
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subset, {
plot(Global_active_power~Datetime, type="l",ylab="Global Active Power (KWs)", xlab="")
plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab="")
plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (KWs)", xlab="")
lines(Sub_metering_2~Datetime,col='Red')
lines(Sub_metering_3~Datetime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1,
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(Global_reactive_power~Datetime, type="l", ylab="Global Rective Power (KWs)",xlab="")
})

#create png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()