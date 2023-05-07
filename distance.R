str(mtcars)
str((cars))

#distance = dependent var
#speed = independent var
scatter.smooth(x = cars$speed,
               y= cars$dist, 
               main = "Distance ~ speed",
               xlab = "Cars Speed",
               ylab = "Stopping distance (meters)")
#seems to be a positive correlation between 
#stopping distance and speed
cor(cars$dist, cars$speed)

#check for outliers
#generally any data that is outside the 
# 1.5 x interquartile range = outlier 
opar <- par(no.readonly = TRUE)
par(mfrow  = c(1,2))
attach(cars)
boxplot(dist, 
        main ="Distance", 
        sub = paste("Outlier rows:", 
                    boxplot.stats(dist)$out))
boxplot(speed, 
        main ="Speed", 
        sub = paste("Outlier rows:", 
                    boxplot.stats(dist)$out))
par(opar)

# there is an outlier where distance = 120 
nrow(cars)

#remove the outlier row
cars <- subset(cars, cars$dist !=120)
nrow(cars)

boxplot(dist, 
        main ="Distance", 
        sub = paste("Outlier rows:", 
                    boxplot.stats(dist)$out))
boxplot(speed, 
        main ="Speed", 
        sub = paste("Outlier rows:", 
                    boxplot.stats(speed)$out))

#check for normality and skewness

install.packages("e1071")
library(e1071)
par(mfrow = c(1,2))
#density plot for speed
plot(density(speed),
     main = "Density plot for speed",
     ylab = "Frequency",
     sub = paste("skewness:", round(e1071::skewness(speed)),2))
#skewness < -1 or > 1 then highly skewed
# -1 tp -0.5 and 0.5 to 1 = moderately skewed
# -0.5 to 0.5 = approx symmetrical 

polygon(density(speed), col = "red")

#density plot for distance
plot(density(dist),
     main = "Density plot for distance",
     ylab = "Frequency",
     sub = paste("skewness:", round(e1071::skewness(dist)),2))
#skewness < -1 or > 1 then highly skewed
# -1 tp -0.5 and 0.5 to 1 = moderately skewed
# -0.5 to 0.5 = approx symmetrical 

polygon(density(dist), col = "red")
