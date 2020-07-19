# Are there differences in activity patterns between weekdays and weekends?


# 1. Create a new factor variable in the dataset with two levels – “weekday” and “weekend” indicating whether a given date is a weekday or weekend day.
data$date <- as.Date(data$date, format = "%Y-%m-%d")
data$weekend <- weekdays(data$date, abbreviate = TRUE) %in% c("Sat", "Sun")

# 2. Make a panel plot containing a time series plot (i.e. type = "l") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all weekday days or weekend days (y-axis). See the README file in the GitHub repository to see an example of what this plot should look like using simulated data.
library(lattice)
data <- aggregate(data$steps, data[,c(3,4)], mean, na.rm = TRUE)
xyplot(x ~ interval | weekend, data = data, layout = c(1,2), type = "l", xlab = "Interval", ylab = "Number of steps", strip = strip.custom(factor.levels = c("weekday", "weekend")))
## save plot
dev.copy(png, "plot4.png")
dev.off()