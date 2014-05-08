
library("sqldf")

file = "./data/household_power_consumption.txt"
strsql = "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"

power = read.csv.sql(file, sql=strsql, header=T, sep=";")

power$Date = as.Date(power$Date, format="%d/%m/%Y")

power$dt = paste(power$Date, power$Time)

power$dt = strptime(power$dt, format="%Y-%m-%d %H:%M:%S")

plot(power$dt, power$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="" )

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

























