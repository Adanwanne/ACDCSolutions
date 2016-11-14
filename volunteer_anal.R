install.packages('ggplot2')
library(ggplot2)

### Narrative of Data ###
#Data since 1993


### How many hours were worked in total? ###
table(volunteer$Hours, useNA='ifany') # There are 0s entered and NAs
sum(na.omit(volunteer$Hours)) 
#123,782.1 hours volunteered since 1994


### How many unique volunteers in total? ###
sum(volunteer$Group.Count[which(!duplicated(volunteer$PeopleID))])
#20294 unique volunteers


### How many hours were worked in total per year? ###
volunteer[,'Year'] <- ''
for(i in as.character(1994:2014)){
  volunteer$Year <- ifelse(substr(volunteer$Effort.Date, nchar(as.character(volunteer$Effort.Date))-1, nchar(as.character(volunteer$Effort.Date))) == substr(as.character(i), 3, 4), as.character(i), volunteer$Year)
}

volunteer %>% 
  select(Year, Hours) %>% 
  group_by(Year) %>% 
  summarize(count=sum(na.omit(Hours))) %>% 
  View()

# 675hrs in 1994, 738hrs in 1995, 286hrs in 1996, 651hrs in 1997, 2175.75hrs in 1998, 3045hrs in 1999, 2777.5hrs in 2000, 2764hrs in 2001, 4564.5hrs in 2002, 5362.75hrs in 2003, 5573.50hrs in 2004, 5372.50hrs in 2005, 4340.00hrs in 2006, 5161.00hrs in 2007, 6504.50hrs in 2008, 7711.66hrs in 2009, 10691.71hrs in 2010, 10303.75hrs in 2011, 9652.10hrs in 2012, 8901.45hrs in 2013, 9659.15hrs in 2014


### How many hours were worked in total per yer per volunteer? ###
volunteer %>% 
  select(Year, Hours, Group.Count, PeopleType) %>% 
  filter(PeopleType != 'Citizen Engagement - NO WORK DONE') %>% 
  group_by(Year) %>% 
  summarize(hours=sum(na.omit(Hours)), volun=sum(na.omit(Group.Count))) %>% 
  mutate(pervol=hours/volun) %>% 
  arrange(desc(pervol))
  View()

#1997 had the highest at 13hrs/volunteer. 1995 had 10.4hrs/volunteer.  
#2014 had the lowest at 2.5hrs/volunteer.
#6315 volunteers without year information.
#Trend that number of logged volunteers has pretty consistently increased over time. In 1996, 28 volunteers. In 2014, 3867 volunteers. Helps explain why the per capita hours volunteered has gone down. Also can indicate better logging of the data.
# NOTE: Excluded PeopleType "Citizen Engagement - NO WORK DONE"


### The average number of hours volunteered for stewards ###
volunteer %>% 
  select(PeopleType, Year, Hours, Group.Count) %>% 
  filter(PeopleType == 'Steward') %>%
  summarize(hours=sum(na.omit(Hours)), volun=sum(na.omit(Group.Count))) %>% 
  mutate(perSteward=hours/volun) %>% 
  View()

volunteer %>% 
  select(PeopleType, Year, Hours, Group.Count) %>% 
  filter(PeopleType == 'Steward') %>% 
  group_by(Year) %>% 
  summarize(hours=sum(na.omit(Hours)), volun=sum(na.omit(Group.Count))) %>% 
  mutate(perSteward=hours/volun) %>% 
  View()

#Steward averages 5.2hrs.
#Most-2008 that rate was 14.2hrs. Least was 1999 at 1hr.


### The average number of hours volunteered for new volunteer ###
length(which(!duplicated(volunteer$PeopleID)))
#There are 16769 volunteers PeopleID logged just once

volunteer[,'Unique'] <- duplicated(volunteer$PeopleID)

volunteer %>% 
  select(PeopleID, Unique, Group.Count, Hours) %>% 
  filter(Unique == FALSE) %>% 
  #group_by(PeopleID) %>% 
  summarize(hours=sum(na.omit(Hours)), volun=sum(na.omit(Group.Count))) %>% 
  mutate(perNewb=hours/volun) %>% 
  View()
  
#New volunteer averages 2.9hrs.

volunteer %>% 
  select(PeopleID, Unique, Group.Count, Hours, Year) %>% 
  filter(Unique == FALSE) %>% 
  group_by(Year) %>% 
  summarize(hours=sum(na.omit(Hours)), volun=sum(na.omit(Group.Count))) %>% 
  mutate(perNewb=hours/volun) %>% 
  View()

#Most-1997 at 13hrs. Least was 2013 at 2hrs. 


### Percent of volunteers by activity ###
activity <- volunteer %>% 
  select(Activity, Group.Count) %>% 
  mutate(total=sum(na.omit(Group.Count))) %>%
  group_by(Activity) %>% 
  summarize(percent=sum(na.omit(Group.Count))/40123 *100) %>% 
  arrange(desc(percent)) %>% 
  View()

#The top 5 volunteer activities by percent are Invasives Control at 48.5%, Trail Work at 19%, and Revegetation at 6.5%.  The least popular at less than 1% is Botanical Survey Training and Mudpuppy Survey.


### Most common volunteer types ###
volunteer %>% 
  select(Group.Count, PeopleType) %>% 
  group_by(PeopleType) %>% 
  summarize(count=n()) %>% 
  arrange(desc(count))

# Most common volunteer types are Private Workday, Public Workday, Individual, Steward, and Training.

activityByType <- volunteer[,c(2,4,5,7)]

activityByType$Activity <- as.character(activityByType$Activity)
activityByType$PeopleType <- as.character(activityByType$PeopleType)

activityByType$PeopleType <- ifelse(grepl('ntern',activityByType$PeopleType), 'Intern', activityByType$PeopleType)
activityByType$PeopleType <- ifelse(grepl('PrI',activityByType$PeopleType), 'Private Workday', activityByType$PeopleType)

activityByType$Activity <- ifelse(grepl('Misc', activityByType$Activity), 'Misc', activityByType$Activity)

activityByType <- activityByType %>% 
  group_by(Activity, PeopleType) %>% 
  summarize(percent=sum(na.omit(Group.Count))/40123 *100) %>% 
  filter(Activity %in% c('Invasives Control', 'Trail Work', 'Revegetation', 'Misc', 'Burn', 'PR Nature Walk')) %>% 
  arrange(desc(percent)) %>% 
  #slice(1:5) %>% 
  View()

activityByType$PeopleType <- ifelse(activityByType$PeopleType == ' ', 'Unspecified', activityByType$PeopleType)

activityByType$PeopleType <- ifelse(grepl('Citizen', activityByType$PeopleType), 'Citizen Engagement', activityByType$PeopleType)

ggplot(activityByType,aes(x=reorder(Activity, desc(percent)), y=percent, fill=PeopleType)) + geom_bar(stat='identity') + xlab("Activity Type") + ylab("Percentage") + scale_x_discrete(labels = abbreviate) + theme_bw()


### How are most volunteers recruited ###
volunteer %>% 
  select(RecruitDetail, Group.Count, Activity) %>% 
  group_by(RecruitDetail) %>% 
  summarize(count=sum(na.omit(Group.Count))) %>% 
  arrange(desc(count))

#The most common recruitment sources are CommunityHighSchool (2116), Emerson_Middle_School (1124), YVC (1017), Huron_High_School (693), and ConcordiaUniversity (644)


### Relationship between volunteer type and activity participated in ###


### Recruitment Method by Year (esp 2011/2012 where there was an increase) ###
volunteer %>% 
  select(RecruitDetail, Group.Count, Activity, Year) %>% 
  group_by(RecruitDetail, Year) %>% 
  filter(Year %in% c('2010', '2011', '2012', '2013', '2014')) %>% 
  summarize(count=sum(na.omit(Group.Count))) %>% 
  na.omit() %>% 
  arrange(desc(count)) %>% 
  View()