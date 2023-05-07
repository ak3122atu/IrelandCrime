str(beaver2)
summary(beaver2)

beavers_data <- beaver2
pairs(beavers_data, labels = colnames(beavers_data),
      main = "Beavers dataset correlation plot")

#labels start with what is assigned to lower value first 

beavers_data$activity <- factor(beavers_data$activ, labels = c("no", "yes"))
beavers_data

attach(beavers_data)
tapply(temp, activity, summary)

plot(beavers_data$activity,
     temp,
     pch = 19,
     col = "lightblue")

#Q2
#display the normality of the data
hist(temp)
#dont do this 
hist(activ)

library(lattice)
histogram(~temp | activity,
          data = beavers_data,
          main = "Distribution of beaver activity data",
          xlab = "Temp(Degrees)", ylab = "Activity (%)")
# Q-Q plot can help to determine normality 
qqnorm (beavers_data$temp)
qqline(temp, col = "red")

qqnorm (beavers_data$activity)
qqline(temp, col = "red")

with(beavers_data, qqnorm(beavers_data$temp[beavers_data$activity == "no"], 
                          beavers_data$temp[beavers_data$activity == "yes"],
                          main = "Comparing 2 samples of activity data", 
                          xlab = "Active = yes",
                          ylab = "Active = no"))





