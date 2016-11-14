frog <- read.csv('/Users/adaezeajoku/Desktop/Data\ Skills\ Dev/A2D2/NAP\ Frog\ Call\ Data2.csv')
install.packages('dplyr')
library(dplyr)

# Get familiar with the dataset
str(frog)
summary(frog)
View(frog)
colnames(frog)

# Number of species that occur per route
frog %>% 
  select(Species, Route.Name) %>% 
  group_by(Species, Route.Name) %>% 
  summarize(count = n()) %>% 
  mutate(frog_park = sum(count))  %>% 
  mutate(group_percent = (count/frog_park * 100))
  

  #' 8) Based on the percentage of people with depression, those under 65 are more likely to have depression with a percentage rate of 47.94%.
  ccpuf %>% 
    group_by(BENE_AGE_CAT_CD, CC_DEPRESSN) %>% 
    summarize(count = n()) %>% 
    mutate(group_depressn = sum(count)) %>% 
    arrange(desc(CC_DEPRESSN)) %>% 
    ungroup %>% 
    slice(1:6) %>% 
    mutate(group_percent = (count/group_depressn * 100)) %>% 
    round(digits = 2) 
  
# The calling levels over time per each route
  