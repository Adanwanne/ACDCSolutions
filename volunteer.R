volunteer <- read.csv('/Users/adaezeajoku/Desktop/Data\ Skills\ Dev/A2D2/NAP\ Volunteer\ Data.csv')

install.packages('dplyr')
library(dplyr)

# Get a feel for the dataset
str(volunteer)
head(volunteer)
colnames(volunteer)
View(volunteer)

# Remove extraneous columns
summary(volunteer)
volunteer <- volunteer[,c(1:12)]

# Volunteer PeopleIDs are not all unique
duplicated(volunteer$PeopleID)
summary(duplicated(volunteer$PeopleID))
volunteer$PeopleID[which(duplicated(volunteer$PeopleID))] 

# Consolidate group counts and notes
group_notes <- volunteer %>% 
  select(PeopleID, Group.Count, Notes) %>% 
  filter(Group.Count == 1) %>% 
  filter(grepl("people", Notes) | grepl("volunteers", Notes))

volunteer$Group.Count[3] <- 11  
volunteer$Group.Count[4] <- 6  
volunteer$Group.Count[6] <- 6  
volunteer$Group.Count[7] <- 7  
volunteer$Group.Count[9] <- 10 
volunteer$Group.Count[10] <- 10 
volunteer$Group.Count[519] <- 11  
volunteer$Group.Count[520] <- 14
volunteer$Group.Count[1248] <- 9
volunteer$Group.Count[1249] <- 22 
         
# Clean PrevVol so only Y or N remains
volunteer %>% 
  mutate(`PrevVol2` = NA) %>% 
  mutate(`PrevVol2` = ifelse(PrevVol %in% c('y', 'Y'), 'Y', `PrevVol2`)) %>%  
  mutate(`PrevVol2` = ifelse(PreVol %in% c('n', 'N'), 'N', `PrevVol2`)) %>% 
  mutate(`PreVol2` = ifelse(PreVol %in% c('', '1', '3', 'b', 'B', 'g', 'm', 'M')))

volunteer$PrevVol2 <- ifwhich(volunteer$PrevVol=='y') = 'Y'
volunteer$PrevVol[which(volunteer$PrevVol == 'n')] = 'N'
volunteer$PrevVol[which(!(volunteer$PrevVol %in% c('Y', 'N')))]= NA
volunteer

# Clean Recruited to remove blanks
volunteer$Recruited[which(volunteer$Recruited %in% c('', 'blank', 'Blank'))] = NA
