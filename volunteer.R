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

#Note: With data cleaning, I was unable to remove old values entirely. Instead they say 0

# Clean PrevVol so only Y or N remains
volunteer$PrevVol[volunteer$PrevVol == 'y'] <- 'Y'
volunteer$PrevVol[volunteer$PrevVol == 'n'] <- 'N'
volunteer$PrevVol[!(volunteer$PrevVol %in% c('Y', 'N'))] <- NA


# Clean Recruited to remove blanks and consolidate same categories
volunteer$Recruited[grepl('AA Observer', volunteer$Recruited)] <-'Newspaper (e.g. A2Observer, Current)'
volunteer$Recruited[grepl('flier', volunteer$Recruited) | grepl('street', volunteer$Recruited)] <- 'Sign/poster  (from NAP)'
volunteer$Recruited[volunteer$Recruited %in% c('website', 'Website (City or NAP)')] <- 'Internet (e.g. website, social media, annarbor.com)'
volunteer$Recruited[volunteer$Recruited %in% c('', ' ', 'blank', 'Blank')] <- NA
volunteer$Recruited[grepl('membership', volunteer$Recruited)] <- 'Group/Organization contact or membership'


# Clean RecruitDetail to remove blanks and consolidate same categories
volunteer$RecruitDetail[volunteer$RecruitDetail %in% c('', ' ')] <- NA 
volunteer$RecruitDetail[grepl('Emerson', volunteer$RecruitDetail)] <- 'Emerson_Middle_School'
volunteer$RecruitDetail[grepl('eslie', volunteer$RecruitDetail)] <- 'LeslieScienceCenter'
volunteer$RecruitDetail[grepl('iker', volunteer$RecruitDetail)] <- "MichiganMountainBiker'sAssociation"
volunteer$RecruitDetail[grepl('echnical', volunteer$RecruitDetail) | grepl('echincal', volunteer$RecruitDetail)] <- 'Washtenaw_Technical_Middle_College'
volunteer$RecruitDetail[grepl('enior', volunteer$RecruitDetail)] <- "AnnArborSeniorCenter"
volunteer$RecruitDetail[grepl('ndian', volunteer$RecruitDetail)] <- "UM_IndianAmericanStudentAssociation"
volunteer$RecruitDetail[grepl('oncordia', volunteer$RecruitDetail)] <- "ConcordiaUniversity"
volunteer$RecruitDetail[grepl('VC', volunteer$RecruitDetail) | grepl('yvc', volunteer$RecruitDetail)] <- 'YVC'
volunteer$RecruitDetail[volunteer$RecruitDetail == 'huronriverdays'] <- 'HuronRiverDays'
volunteer$RecruitDetail[grepl('ision', volunteer$RecruitDetail)] <- 'EMU_Vision'
volunteer$RecruitDetail[grepl('ioneer', volunteer$RecruitDetail)] <- 'PioneerHighSchool'
volunteer$RecruitDetail[grepl('emuC', volunteer$RecruitDetail)] <- 'EMUCircleK'
volunteer$RecruitDetail[volunteer$RecruitDetail == 'Circle K'] <- 'CircleK'
volunteer$RecruitDetail[grepl('ityS', volunteer$RecruitDetail)] <- 'UM_CommunityScholars'
volunteer$RecruitDetail[volunteer$RecruitDetail == 'unitedway'] <- 'UnitedWay'
volunteer$RecruitDetail[grepl('Skyline', volunteer$RecruitDetail)] <- 'SkylineHighSchool'
volunteer$RecruitDetail[volunteer$RecruitDetail == 'interact' | volunteer$RecruitDetail == 'InteractHuron'] <- 'Interact'
volunteer$RecruitDetail[volunteer$RecruitDetail =='UMSI'] <- 'UM_SchoolofInformation'
volunteer$RecruitDetail[volunteer$RecruitDetail =='patrol200cubscouts'] <- 'Patrol200CubScouts'
volunteer$RecruitDetail[grepl('toyota', volunteer$RecruitDetail)] <- 'ToyotaboshokuAmerica'
volunteer$RecruitDetail[grepl('SBDNORTHAMERICA', volunteer$RecruitDetail)] <- 'SBDNORTHAMERICA'
volunteer$RecruitDetail[grepl('Indeed', volunteer$RecruitDetail)] <- 'WomenIndeed'
volunteer$RecruitDetail[volunteer$RecruitDetail == 'pack22'] <- "Pack22"
volunteer$RecruitDetail[grepl('um_lawSchool', volunteer$RecruitDetail)] <- 'UM_LawSchool'
volunteer$RecruitDetail[grepl('Audubon', volunteer$RecruitDetail)] <- 'Washtenaw Audubon'
volunteer$RecruitDetail[grepl('StPaul', volunteer$RecruitDetail)] <- 'StPaulLutheranChurch'
volunteer$RecruitDetail[volunteer$RecruitDetail == 'Boy Scout Pack 131'] <- "BoyScoutPack131"

write.csv(volunteer, "napVolunteerData.csv")
