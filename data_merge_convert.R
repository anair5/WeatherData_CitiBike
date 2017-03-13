# Read the data

oct16 <- read.csv("201610-citibike-tripdata.csv")
nov16 <- read.csv("201611-citibike-tripdata.csv")
dec16 <- read.csv("201612-citibike-tripdata.csv")
weather <- read.csv("weather_NY.csv")



# Convert the data type of column 'starttime' from factor to date

oct16$Start.Time <- strptime(oct16$Start.Time, format = "%Y-%m-%d %H:%M:%S")
oct16$Stop.Time <- strptime(oct16$Stop.Time, format = "%Y-%m-%d %H:%M:%S")
nov16$Start.Time <- strptime(nov16$Start.Time, format = "%Y-%m-%d %H:%M:%S")
nov16$Stop.Time <- strptime(nov16$Stop.Time, format = "%Y-%m-%d %H:%M:%S")
dec16$Start.Time <- strptime(dec16$Start.Time, "%Y-%m-%d %H:%M:%S")
dec16$Stop.Time <- strptime(dec16$Stop.Time, format = "%Y-%m-%d %H:%M:%S")

weather$DATE <- strptime(weather$DATE, format = "%Y%m%d")


# Add new column called 'Date' in the oct16, nov16, dec16
oct16$Date <- as.Date(oct16$Start.Time, format = "%Y-%m-%d")
nov16$Date <- as.Date(nov16$Start.Time, format = "%Y-%m-%d")
dec16$Date <- as.Date(dec16$Start.Time, format = "%Y-%m-%d")


# Merge the data of three months
fourq2016 <- rbind(oct16, nov16, dec16)


# Extract as CSV
write.csv(fourq2016, file="fourq2016.csv")
write.csv(dec16, file="dec16.csv")
write.csv(weather, file="weather.csv")
