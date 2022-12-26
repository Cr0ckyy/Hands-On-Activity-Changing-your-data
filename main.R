# Install the tidyverse, skimr, and janitor packages
install.packages("tidyverse")
install.packages("skimr")
install.packages("janitor")

# Load the tidyverse, skimr, and janitor packages
library(tidyverse)
library(skimr)
library(janitor)

# Read in the hotel bookings data
hotel_bookings <- read_csv("hotel_bookings.csv")

# Check the first few rows of the data
head(hotel_bookings)

# Look at the structure of the data
str(hotel_bookings)

# Get a more detailed overview of the data
glimpse(hotel_bookings)

# View the column names of the data
colnames(hotel_bookings)

# Arrange the data by lead time in ascending order
arrange(hotel_bookings, lead_time)

# Arrange the data by lead time in descending order
arrange(hotel_bookings, desc(lead_time))

# Check the first few rows of the data again
head(hotel_bookings)

# Create a new version of the data, sorted by lead time in descending order
hotel_bookings_v2 <- arrange(hotel_bookings, desc(lead_time))

# Check the first few rows of the new version of the data
head(hotel_bookings_v2)

# Find the maximum lead time in the original data
max(hotel_bookings$lead_time)

# Find the minimum lead time in the original data
min(hotel_bookings$lead_time)

# Find the minimum lead time in the new version of the data
min(lead_time)

# Calculate the mean lead time in the original data
mean(hotel_bookings$lead_time)

# Calculate the mean lead time in the new version of the data
mean(hotel_bookings_v2$lead_time)

# Filter the data to include only bookings at the City Hotel
hotel_bookings_city <- filter(hotel_bookings, hotel_bookings$hotel == "City Hotel")

# Check the first few rows of the filtered data
head(hotel_bookings_city)

# Calculate the mean lead time for bookings at the City Hotel
mean(hotel_bookings_city$lead_time)

# Create a summary table of lead time statistics by hotel
hotel_summary <- hotel_bookings %>%
  group_by(hotel) %>%
  summarise(average_lead_time = mean(lead_time),
            min_lead_time = min(lead_time),
            max_lead_time = max(lead_time))

# View the summary table
head(hotel_summary)
