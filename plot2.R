
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

png("plot2.png", width=480, height=480)

# Plot 2
plot(x = household_df$DateTime, y = household_df$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = NA)

dev.off()
