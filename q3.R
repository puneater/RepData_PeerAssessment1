# Imputing missing values


# 1. Calculate and report the total number of missing values in the dataset (i.e. the total number of rows with NAs)
nas = as.numeric(summary(complete.cases(data))["FALSE"])

# 2. Devise a strategy for filling in all of the missing values in the dataset. The strategy does not need to be sophisticated. For example, you could use the mean/median for that day, or the mean for that 5-minute interval, etc.
d1 <- tapply(data$steps, data$interval, mean, na.rm =TRUE)

# 3. Create a new dataset that is equal to the original dataset but with the missing data filled in.
data2 <- data
data2[is.na(data2)] <- d1[as.character(data2$interval[is.na(data2)])]

# 4. Make a histogram of the total number of steps taken each day and Calculate and report the mean and median total number of steps taken per day. Do these values differ from the estimates from the first part of the assignment? What is the impact of imputing missing data on the estimates of the total daily number of steps?
d2 <- tapply(data2$steps, data2$date, sum)
hist(d2, main = "Total Steps Taken Each Day [NAs filled]", xlab = "Number of Steps", ylab = "Number of Days", col = "darkmagenta", breaks = 20)
## saving the plot
dev.copy(png, file = "plot3.png")
dev.off()

mn2 <- mean(d2)
md2 <- median(d2)

# clearing the memory
rm(list = c("data2", "d1", "d2", "mn2", "md2", "nas"))