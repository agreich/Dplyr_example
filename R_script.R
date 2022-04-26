#Data wrangling
#read in data
Redfish <- read.csv("Growth data - Redfish_Lake_growth_data Data.csv")

#View
View(Redfish)
names(Redfish)

#%>%
##piping
##"makes code more readable"

#select
Redfish_relevant <- Redfish %>% select(Individual, Species,Spawner.Lg..Mm., Spawner.Wt..G., Spawner.Id )
View(Redfish_relevant)

#na.omit
Redfish_relevant <- na.omit(Redfish_relevant)
View(Redfish_relevant)



##load in sablefish dataset?

