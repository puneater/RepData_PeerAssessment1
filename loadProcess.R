# loading data
data <- read.csv(unz("activity.zip", "activity.csv"))


# preprocessing, converting date to POSIXlt
data$date <- strptime(data$date, format = "%Y-%m-%d")
data$date <- as.factor(data$date)