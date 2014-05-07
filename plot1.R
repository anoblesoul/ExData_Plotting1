#unzip("./data/exdata_data_household_power_consumption.zip", exdir="./data")

library("sqldf")

file = "./data/household_power_consumption.txt"
strsql = "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"

power = read.csv.sql(file, sql=strsql, header=T, sep=";")

hist(power$Global_active_power, breaks=12, col="Red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()

?dev.copy

























