# What is mean total number of steps taken per day?


# 1. Calculate the total number of steps taken per day
d1 <- tapply(data$steps, data$date, sum, na.rm = TRUE)

# 2. If you do not understand the difference between a histogram and a barplot, research the difference between them. Make a histogram of the total number of steps taken each day
hist(d1, main = "Total Steps Taken Each Day", xlab = "Number of Steps", ylab = "Number of Days", col = "darkred", breaks = 20)
## saving the plot
dev.copy(png, file = "plot1.png")
dev.off()

# 3. Calculate and report the mean and median of the total number of steps taken per day
mn <- mean(d1)
md <- median(d1)
# clearing d1 from memory
rm(list = c("d1", "md", "mn"))