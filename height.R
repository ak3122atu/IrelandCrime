women_data <- women 
#predict weight from height 
# height - continuous independent 
# weight = continuous dependent 
#syntax is y ~ x + z  + w
attach(women_data)
simple_linear_model <- lm(weight ~ height, women_data)
simple_linear_model

#weight = ~87.52 + 3.45 * height

#plot dependent var on y-axis
# and independent var on x- axis
plot(height, 
     weight,
     xlab = "Height (inches)",
     ylab = "Weight lbs", 
     main = "Scatter plot regression line for weight predicted from height" )
abline(simple_linear_model)

summary(simple_linear_model)

#h0 - no relationship between x and y 
#h1 - there is a relationship between x and y

#correlation coefficient between height and weight 
# -1 perfect negative corr
# -02 < x < 0.2 = most of the variation is not 
# explanable by the independent variable
# +1 = perfect positive correlation

confint(simple_linear_model)
cor(height, weight)

#goodness of fit 
summary(simple_linear_model)
