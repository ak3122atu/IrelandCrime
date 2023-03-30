# reading the dataset IrelandCrime into a data frame called Ireland_crime
Ireland_crime <- read.csv("IrelandCrime.csv", na = "")

#showing the structure of Ireland_Crime 
str(Ireland_crime)

#showing the first 10 rows 
head(Ireland_crime, 10)

#recoding missing data with na
is.na(Ireland_crime)
Ireland_crime[Ireland_crime == ""] <- NA
Ireland_crime


#renaming the variables
names(Ireland_crime)
names(Ireland_crime)[1] <- "Region"
names(Ireland_crime)
names(Ireland_crime)[2] <- "Division"
names(Ireland_crime)[3] <- "OffenceCode"
names(Ireland_crime)[4] <- "Offence"
names(Ireland_crime)[5] <- "OffenceType"
names(Ireland_crime)

#selecting crime statistics only from 2015 to 2019
Ireland_crime <- (Ireland_crime[, c(1:5, 54:72)])
names(Ireland_crime)

#showing the structure of Ireland_crime
str(Ireland_crime)

#modifying the offence descriptions 
Ireland_crime$OffenceType[Ireland_crime$OffenceType == "ATTEMPTS/THREATS TO MURDER/ASSAULTS/ HARASSMENTS AND RELATED OFFENCES"] <- "Murder/assault/harassment"
Ireland_crime$OffenceType[Ireland_crime$OffenceType == "DANGEROUS OR NEGLIGENT ACTS"] <- "Dangerous acts"
Ireland_crime$OffenceType[Ireland_crime$OffenceType == "KIDNAPPING AND RELATED OFFENCES"] <- "Kidnapping
"
Ireland_crime$OffenceType[Ireland_crime$OffenceType == "ROBBERY/EXTORTION AND HIJACKING OFFENCES"] <- "Robbery"
Ireland_crime$OffenceType[Ireland_crime$OffenceType == "THEFT AND RELATED OFFENCES
"] <- "Theft"
Ireland_crime$OffenceType[Ireland_crime$OffenceType == "FRAUD/DECEPTION AND RELATED OFFENCES"] <- "Fraud"
Ireland_crime$OffenceType[Ireland_crime$OffenceType == "PUBLIC ORDER AND OTHER SOCIAL CODE OFFENCES"] <- "Public Order"
Ireland_crime$OffenceType[Ireland_crime$OffenceType == "OFFENCES AGAINST GOVERNMENT/ JUSTICE PROCEDURES AND ORGANISATION OF CRIME"] <- "Offences against government"
Ireland_crime

#counting the Murder/assault/harassment instances
sum(Ireland_crime$OffenceType == "Murder/assault/harassment")

#counting the Murder/assault/harassment instances 
sum(Ireland_crime$OffenceType == "Offences against government")

#Creating a new variable called Crime Summary 
Crime_Summary <- (Ireland_crime$X2015Q1 + Ireland_crime$X2015Q2 + Ireland_crime$X2015Q3 + Ireland_crime$X2015Q4
                  + Ireland_crime$X2016Q1 + Ireland_crime$X2016Q2 + Ireland_crime$X2016Q3 + Ireland_crime$X2016Q4
                  + Ireland_crime$X2017Q1 + Ireland_crime$X2017Q2 + Ireland_crime$X2017Q3 + Ireland_crime$X2017Q4
                  + Ireland_crime$X2018Q1 + Ireland_crime$X2018Q2 + Ireland_crime$X2018Q3 + Ireland_crime$X2018Q4
                  + Ireland_crime$X2019Q1 + Ireland_crime$X2019Q2 + Ireland_crime$X2019Q3)
#displaying the contents of Crime_Summary
Crime_Summary
summary(Crime_Summary)
# the summary shows the rows that contain NA which is 1. It also shows the median of the crimes between 2015 and 2019.
# the summary also shows the maximum crimes committed in a quarter and it also shows the mean of crimes 

#using VIM packages to analyse missing data 
install.packages("VIM")
library(VIM)
missing_values <- aggr(Ireland_crime$Offence, prop = FALSE, numbers = TRUE)

# Show summary of the contents of missing_values
summary(missing_values)
missing_values

complete.cases(Ireland_crime)

#the data is completely missing at random as the data that is missing in not related or dependent on other data 

write.csv(Ireland_crime)
