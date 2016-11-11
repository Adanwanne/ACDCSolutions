all_bird95 <- read.csv('/Users/adaezeajoku/Desktop/Data\ Skills\ Dev/A2D2/All\ Bird\ Data\ from\ eBird\ 1995.csv')
all_bird96 <- read.csv('/Users/adaezeajoku/Desktop/Data\ Skills\ Dev/A2D2/All\ Bird\ Data\ from\ eBird\ 1996.csv')
all_bird97 <- read.csv('/Users/adaezeajoku/Desktop/Data\ Skills\ Dev/A2D2/All\ Bird\ Data\ from\ eBird\ 1997.csv')
all_bird98 <- read.csv('/Users/adaezeajoku/Desktop/Data\ Skills\ Dev/A2D2/All\ Bird\ Data\ from\ eBird\ 1998.csv')
all_bird99 <- read.csv('/Users/adaezeajoku/Desktop/Data\ Skills\ Dev/A2D2/All\ Bird\ Data\ from\ eBird\ 1999.csv')
all_bird00 <- read.csv('/Users/adaezeajoku/Desktop/Data\ Skills\ Dev/A2D2/All\ Bird\ Data\ from\ eBird\ 2000.csv')
all_bird01 <- read.csv('/Users/adaezeajoku/Desktop/Data\ Skills\ Dev/A2D2/All\ Bird\ Data\ from\ eBird\ 2001.csv')
all_bird02 <- read.csv('/Users/adaezeajoku/Desktop/Data\ Skills\ Dev/A2D2/All\ Bird\ Data\ from\ eBird\ 2002.csv')
all_bird03 <- read.csv('/Users/adaezeajoku/Desktop/Data\ Skills\ Dev/A2D2/All\ Bird\ Data\ from\ eBird\ 2003.csv')
all_bird04 <- read.csv('/Users/adaezeajoku/Desktop/Data\ Skills\ Dev/A2D2/All\ Bird\ Data\ from\ eBird\ 2004.csv')
all_bird05 <- read.csv('/Users/adaezeajoku/Desktop/Data\ Skills\ Dev/A2D2/All\ Bird\ Data\ from\ eBird\ 2005.csv')
all_bird06 <- read.csv('/Users/adaezeajoku/Desktop/Data\ Skills\ Dev/A2D2/All\ Bird\ Data\ from\ eBird\ 2006.csv')
all_bird07 <- read.csv('/Users/adaezeajoku/Desktop/Data\ Skills\ Dev/A2D2/All\ Bird\ Data\ from\ eBird\ 2007.csv')
all_bird08 <- read.csv('/Users/adaezeajoku/Desktop/Data\ Skills\ Dev/A2D2/All\ Bird\ Data\ from\ eBird\ 2008.csv')
all_bird09 <- read.csv('/Users/adaezeajoku/Desktop/Data\ Skills\ Dev/A2D2/All\ Bird\ Data\ from\ eBird\ 2009.csv')
all_bird10 <- read.csv('/Users/adaezeajoku/Desktop/Data\ Skills\ Dev/A2D2/All\ Bird\ Data\ from\ eBird\ 2010.csv')
all_bird11 <- read.csv('/Users/adaezeajoku/Desktop/Data\ Skills\ Dev/A2D2/All\ Bird\ Data\ from\ eBird\ 2011.csv')
all_bird12 <- read.csv('/Users/adaezeajoku/Desktop/Data\ Skills\ Dev/A2D2/All\ Bird\ Data\ from\ eBird\ 2012.csv')
all_bird13 <- read.csv('/Users/adaezeajoku/Desktop/Data\ Skills\ Dev/A2D2/All\ Bird\ Data\ from\ eBird\ 2013.csv')
all_bird14 <- read.csv('/Users/adaezeajoku/Desktop/Data\ Skills\ Dev/A2D2/All\ Bird\ Data\ from\ eBird\ 2014.csv')

all_bird95[,'Year.Observed'] <- '1995' 
all_bird95 <- all_bird95[,c(ncol(all_bird95), 1:(ncol(all_bird95)-1))]

all_bird96[,'Year.Observed'] <- '1996' 
all_bird96 <- all_bird96[,c(ncol(all_bird96), 1:(ncol(all_bird96)-1))]

all_bird97[,'Year.Observed'] <- '1997' 
all_bird97 <- all_bird97[,c(ncol(all_bird97), 1:(ncol(all_bird97)-1))]

all_bird98[,'Year.Observed'] <- '1998' 
all_bird98 <- all_bird98[,c(ncol(all_bird98), 1:(ncol(all_bird98)-1))]

all_bird99[,'Year.Observed'] <- '1999' 
all_bird99 <- all_bird99[,c(ncol(all_bird99), 1:(ncol(all_bird99)-1))]

all_bird00[,'Year.Observed'] <- '2000' 
all_bird00 <- all_bird00[,c(ncol(all_bird00), 1:(ncol(all_bird00)-1))]

all_bird01[,'Year.Observed'] <- '2001' 
all_bird01 <- all_bird01[,c(ncol(all_bird01), 1:(ncol(all_bird01)-1))]

all_bird02[,'Year.Observed'] <- '2002' 
all_bird02 <- all_bird02[,c(ncol(all_bird02), 1:(ncol(all_bird02)-1))]

all_bird03[,'Year.Observed'] <- '2003' 
all_bird03 <- all_bird03[,c(ncol(all_bird03), 1:(ncol(all_bird03)-1))]

all_bird04[,'Year.Observed'] <- '2004' 
all_bird04 <- all_bird04[,c(ncol(all_bird04), 1:(ncol(all_bird04)-1))]

all_bird05[,'Year.Observed'] <- '2005' 
all_bird05 <- all_bird05[,c(ncol(all_bird05), 1:(ncol(all_bird05)-1))]
all_bird05$Number.of.Parks <- as.integer(all_bird05$Number.of.Parks)

all_bird06[,'Year.Observed'] <- '2006' 
all_bird06 <- all_bird06[,c(ncol(all_bird06), 1:(ncol(all_bird06)-1))]

all_bird07[,'Year.Observed'] <- '2007' 
all_bird07 <- all_bird07[,c(ncol(all_bird07), 1:(ncol(all_bird07)-1))]

all_bird08[,'Year.Observed'] <- '2008' 
all_bird08 <- all_bird08[,c(ncol(all_bird08), 1:(ncol(all_bird08)-1))]

all_bird09[,'Year.Observed'] <- '2009' 
all_bird09 <- all_bird09[,c(ncol(all_bird09), 1:(ncol(all_bird09)-1))]

all_bird10[,'Year.Observed'] <- '2010' 
all_bird10 <- all_bird10[,c(ncol(all_bird10), 1:(ncol(all_bird10)-1))]

all_bird11[,'Year.Observed'] <- '2011' 
all_bird11 <- all_bird11[,c(ncol(all_bird11), 1:(ncol(all_bird11)-1))]

all_bird12[,'Year.Observed'] <- '2012' 
all_bird12 <- all_bird12[,c(ncol(all_bird12), 1:(ncol(all_bird12)-1))]

all_bird13[,'Year.Observed'] <- '2013' 
all_bird13 <- all_bird13[,c(ncol(all_bird13), 1:(ncol(all_bird13)-1))]

all_bird14[,'Year.Observed'] <- '2014' 
all_bird14 <- all_bird14[,c(ncol(all_bird14), 1:(ncol(all_bird14)-1))]


all_bird <- bind_rows(all_bird95, all_bird96, all_bird97, all_bird98, all_bird99, all_bird00, all_bird01, all_bird02, all_bird03, all_bird04, all_bird05, all_bird06, all_bird07, all_bird08, all_bird09, all_bird10, all_bird11, all_bird12) 

#These years cannot be combined with others because they contain X's (factor types) that are incompatible with integer type:
for(i in c(4:ncol(all_bird))){
  all_bird[,i] <- as.character(all_bird[,i])
}

#Now I can:
all_bird <- bind_rows(all_bird, all_bird2)

write.csv(all_bird, "allBirdData.csv")
