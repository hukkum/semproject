library(lavaan)

# Specify the model
model <- '
   # UTAUT2 Measurement Model
  
   PE =~ PE1+PE2+PE3+PE4+PE5
   EF =~ EF1+EF2+EF3+EF4
   FC =~ FC1+FC2+FC3+FC4+FC5
   HM =~ HM1+HM2+HM3+HM4
   SI =~ SI1+SI2+SI3+SI4
   HB =~ Habit1+Habit2+Habit3+Habit4 
   IU =~ ITU1+ITU2+ITU3+ITU4+ITU5+ITU6+ITU7+ITU8+ITU8+ITU9+ITU10+ITU11
   UB =~ UB1+UB2+UB3+UB4
  
  #UTAUT2 Structural Model
  IU =~ PE+EF+FC+HM+SI+HB
  UB =~ HB+IU+FC
'

# Fit the model
fit <- cfa(model, data = Raw_data_to_analyze_SEM)


# Find the fit summary

summary(fit,fit.measures=TRUE,standardized=TRUE, rsquare=TRUE)


# Revise model with relationship beteen variables. 

model2 <- '
   # UTAUT Measurement Model
  
   PE =~ PE1+PE2+PE3+PE4+PE5
   EF =~ EF1+EF2+EF3+EF4
   FC =~ FC1+FC2+FC3+FC4+FC5
   HM =~ HM1+HM2+HM3+HM5+HM6
   SI =~ SI1+SI2+SI3+SI4
   HB =~ Habit1+Habit2+Habit3+Habit4 
   IU =~ ITU1+ITU2+ITU3+ITU4+ITU5+ITU6+ITU7+ITU8+ITU8+ITU9+ITU10+ITU11
   UB =~ UB1+UB2+UB3+UB4
   IU~EF+PE+HM+SI+HB+FC
   UB~HB+IU+FC
   PE~EF~FC~HM~SI~HB~IU~UB
'

# SEM PLot

semPaths(fit)
#unstandardized coefficients
semPaths(fit,what="est")
#standardized coefficients
semPaths(fit,what="stand")

