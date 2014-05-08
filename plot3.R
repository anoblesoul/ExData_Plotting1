library("sqldf")

file = "./data/household_power_consumption.txt"
strsql = "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"

power = read.csv.sql(file, sql=strsql, header=T, sep=";")

power$Date = as.Date(power$Date, format="%d/%m/%Y")

power$dt = paste(power$Date, power$Time)

power$dt = strptime(power$dt, format="%Y-%m-%d %H:%M:%S")

plot(power$dt, power$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="" )
points(power$dt, power$Sub_metering_1, type="l")
points(power$dt, power$Sub_metering_2, type="l", col="Red")
points(power$dt, power$Sub_metering_3, type="l", col="Blue")
legend("topright", col = c("black", "red", "blue"), lty=c(1,1,1), cex=0.85, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

