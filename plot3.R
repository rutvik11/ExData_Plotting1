
# Read the dataset
household_df <- read.table("household_power_consumption.txt", header = T, na.strings = "?", sep = ";")
# Inspect the variables
str(household_df)

# Format Dates
household_df$Date <- as.Date(household_df$Date, "%d/%m/%Y")

# Subset the data 
household_df <- household_df[(household_df$Date >= "2007-02-01") & (household_df$Date <= "2007-02-02"), ]

# Create a variable DateTime 
household_df$DateTime <- as.POSIXct(paste(household_df$Date, household_df$Time), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)

# Plot 3

plot(household_df$DateTime, household_df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(household_df$DateTime, household_df$Sub_metering_2, col="red")
lines(household_df$DateTime, household_df$Sub_metering_3, col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()

