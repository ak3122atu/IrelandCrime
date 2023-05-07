? mtcars
str(mtcars)
cars_data <- mtcars
str(cars_data)
pairs(cars_data, labels = colnames(cars_data), main = "Cars dataset correlation plot")
install.packages("psych")
library(psych)
pairs.panels(cars_data,
             smooth = TRUE,      # If TRUE, draws loess smooths
             scale = FALSE,      # If TRUE, scales the correlation text font
             density = TRUE,     # If TRUE, adds density plots and histograms
             ellipses = TRUE,    # If TRUE, draws ellipses
             method = "spearman",# Correlation method (also "pearson" or "kendall")
             pch = 21,           # pch symbol
             lm = FALSE,         # If TRUE, plots linear fit rather than the LOESS (smoothed) fit
             cor = TRUE,         # If TRUE, reports correlations
             jiggle = FALSE,     # If TRUE, data points are jittered
             factor = 2,         # Jittering factor
             hist.col = 4,       # Histograms color
             stars = TRUE,       # If TRUE, adds significance level with stars
             ci = TRUE)          # If TRUE, adds confidence intervals
attach(cars_data)
plot(cars_data$mpg, wt, pch = 19, col = "lightblue")
library("lattice")
attach(cars_data)
histogram(wt, 
          data = cars_data, 
          main = "Distribution of Car data", 
          xlab = "Weight of the car", 
          ylab = "Fuel efficiency")
detach(beavers_data)

attach(cars_data)
histogram(mpg, 
          data = cars_data, 
          main = "Distribution of Car data", 
          xlab = "Fuel efficiency", 
          ylab = "Weight of the car")
detach(cars_data)

attach(cars_data)
qqnorm(mpg, main = "QQ Plot for MPG")
qqline(mpg, col = "red")
detach(cars_data)

attach(cars_data)
qqnorm(wt, main = "QQ Plot for WT")
qqline(wt, col = "red")
detach(cars_data)
par(opar)

#shapiro-wilks test 
# p value < 0.05 not normally distributed 
# p value > 0.05 normally distributed 

normality_test <- shapiro.test(cars_data$mpg)
normality_test$p.value

normality_test <- shapiro.test(cars_data$wt)
normality_test$p.value

cor.test(wt, mpg, method=c("pearson"))

#Q4 
#convert am to a factor as it is categorical

cars_data$am <- factor(cars_data$am, 
                labels = c("automatic", "manual"))

histogram (~hp | am,
           data = cars_data,
           main = "Horsepower distribution by transmission type")

shapiro.test(cars_data$am)
tapply(hp, am, shapiro.test)

shapiro.test(hp)
#summary 
#hp = not normally distributed (independent)
#am = not normally distributed (categorical) (dependent)

#mann whitney test 