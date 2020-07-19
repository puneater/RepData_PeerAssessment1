# What is the average daily activity pattern?


# 1. Make a time series plot (i.e. type = "l") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all days (y-axis)
d1 <- tapply(data$steps, data$interval, mean, na.rm =TRUE)
plot(names(d1), d1, type = "l", col = "darkblue", xlab = "Time (24 hrs format)", ylab = "Steps (averaged on all days)", main = "Number of Steps vs Time")
## saving the plot
dev.copy(png, file = "plot2.png")
dev.off()

# 2. Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?
int <- names(d1)[d1 == max(d1)]
## clearing d1 from memory
rm(d1)