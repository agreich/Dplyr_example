#Data wrangling
#read in data
Redfish <- read.csv("Growth data - Redfish_Lake_growth_data Data.csv")
library(tidyverse)
library(dplyr)

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

#plot it
library(ggplot2)
names(Redfish_relevant)
ggplot(Redfish_relevant) + aes(x=Spawner.Lg..Mm., y=Spawner.Wt..G.) + geom_point()


Redfish_filtered <- Redfish_relevant %>% 
  filter(Spawner.Lg..Mm.> 400) %>%
  filter(Spawner.Lg..Mm.< 600)
ggplot(Redfish_filtered) + aes(x=Spawner.Lg..Mm., y=Spawner.Wt..G.) + geom_point()


#mutate
##codition factor: W/L
Redfish_filtered_condition <- Redfish_filtered %>%
  mutate(Condition_factor = Spawner.Wt..G./Spawner.Lg..Mm.)
names(Redfish_filtered_condition)
View(Redfish_filtered_condition) #view it
hist(Redfish_filtered_condition$Condition_factor) #plot it

#combind datasets(sablefish?)
Individual <- Redfish_filtered_condition$Individual
length(Redfish_filtered_condition$Individual)
egg_weight<-runif(282, min=1, max=3)
new_df <- data.frame(Individual, egg_weight)

Redfish_joined <- full_join(Redfish_filtered_condition, new_df, by="Individual")
names(Redfish_joined)
View(Redfish_joined)
