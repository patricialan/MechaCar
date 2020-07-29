# import dependency
library(tidyverse)

# linear model to predict mpg of MechaCar prototypes

# read csv file
tbl_mecha <- read.csv('R_analysis/MechaCar/MechaCar_mpg.csv')

# check variables for normal distribution (qualitative check)
ggplot(tbl_mecha, aes(x=mpg)) + geom_density()
ggplot(tbl_mecha, aes(x=vehicle.length)) + geom_density()
ggplot(tbl_mecha, aes(x=vehicle.weight)) + geom_density()
ggplot(tbl_mecha, aes(x=spoiler.angle)) + geom_density()
ggplot(tbl_mecha, aes(x=ground.clearance)) + geom_density()

# generate multiple linear regression model
lm(mpg ~ vehicle.length + vehicle.weight + spoiler.angle + ground.clearance,data=tbl_mecha)
# statistical metrics of multiple linear regression
summary(lm(mpg ~ vehicle.length + vehicle.weight + spoiler.angle + ground.clearance,data=tbl_mecha))

# ----------------------------------

# suspension coil summary statistics

# read csv file
tbl_coil <- read.csv('R_analysis/MechaCar/Suspension_Coil.csv',stringsAsFactors=F)

# check PSI for normal distribution (qualitative check)
ggplot(tbl_coil, aes(x=PSI)) + geom_density()

# create summary table
summary <- tbl_coil %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))
View(summary)

# ----------------------------------

# suspension coil T-Test (compare to population mean of 1,500 PSI)
t.test(tbl_coil$PSI,mu=1500)
