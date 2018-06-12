
# Read the dataset
household_df <- read.table("household_power_consumption.txt", header = T, na.strings = "?", sep = ";")
# Inspect the variables
str(household_df)

# Format Dates
household_df$Date <- as.Date(household_df$Date, "%d/%m/%Y")

# Subset the data 
household_df <- household_df[(household_df$Date >= "2007-02-01") & (household_df$Date <= "2007-02-02"), ]

png("plot1.png", width=480, height=480)

# Plot 1
hist(household_df$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

dev.off()
