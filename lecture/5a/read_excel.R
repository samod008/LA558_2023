# Importing an excel file - lecture 5a
# 
# February 14, 2023
# Chris Seeger


install.packages(c("tidyverse", "googlesheets4"))

#library(googlesheets4)
#library(tidyverse)
library("readxl")

# You need to know what your working directory is
# I like to save my file and then go to the Session --> Set Working Directory
# --> To Source File Location. As you become more familiar with R you can use
# other methods to do this.


cEnrollment <- read_excel("2021-2022 Iowa Public School District PreK-12 Enrollments by District, Grade, Race and Gender.xlsx", "for R") 

cEnrollmentList <- cEnrollment %>%
  group_by(COUNTYNAME) %>%
  summarize(TotalK12= sum(TotalK12), 
            HispanicTotal = sum(HispanicTotal), 
            HispanicPercent = sum(HispanicTotal)/sum(TotalK12), 
            NativeAmericanTotal = sum(NativeAmericanTotal), 
            AsianTotal = sum(AsianTotal), 
            BlackTotal = sum(BlackTotal), 
            PacificIslanderTotal= sum(PacificIslanderTotal), 
            WhiteTotal = sum(WhiteTotal), 
            MultiRaceTotal = sum(MultiRaceTotal), 
            MaleTotal = sum(TotalMale), 
            MalePercent = sum(TotalMale)/sum(TotalK12), 
            FemaleTotal = sum(TotalFemale)/sum(TotalK12),
            dCount = n()) 
cEnrollmentList 

library(maps)     # Provides latitude and longitude data for various maps