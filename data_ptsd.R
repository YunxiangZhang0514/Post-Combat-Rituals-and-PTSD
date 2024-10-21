library(readxl)
library(knitr)  
library(kableExtra)
library(tidyverse)
library(stringr)
library(tidyverse)
rituals <- read_excel("Copy of Coded data from postcombat rituals July 18.xlsx")
rituals <- subset(rituals, select = -`What is the name of the culture...2`)
names(rituals)[names(rituals) == 'What is the name of the culture...4'] <- 'What is the name of the culture'
glimpse(rituals)

# Africa data
data_africa <- rituals %>% filter(str_detect(`What is the culture’s region`, "Africa")==TRUE)

# Asia data
data_asia <- rituals %>% filter(str_detect(`What is the culture’s region`, "Asia")==TRUE)

# Middle East data
data_mid_east <- rituals %>% filter(str_detect(`What is the culture’s region`, "Middle East")==TRUE)

# North America data
data_na <- rituals %>% filter(str_detect(`What is the culture’s region`, "North America")==TRUE)

# Oceania
data_oceania <- rituals %>% filter(str_detect(`What is the culture’s region`, "Oceania")==TRUE)

# South America
data_sa <- rituals %>% filter(str_detect(`What is the culture’s region`, "South America")==TRUE)

