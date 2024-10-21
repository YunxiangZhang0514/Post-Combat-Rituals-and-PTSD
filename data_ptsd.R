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


# Subset the first 63 rows of the 'rituals' dataset
rituals_subset <- rituals[1:63, ]

# Create a contingency table using the subset of the dataset
table_result <- table(rituals_subset$`Based on your reading of the text, would you consider the ritual rite of passage?`, 
                      rituals_subset$`Does the Ritual appear to involve a Purification/Cleansing of the participant?`)

# Convert the table to a data frame for easier plotting
df_table <- as.data.frame(table_result)

# Rename columns for easier reference
colnames(df_table) <- c("Ritual_Rite_of_Passage", "Purification_Cleansing", "Count")

# Combine the two columns into one label (e.g., "Yes to Yes", "Yes to No")
df_table$Combination <- paste(df_table$Ritual_Rite_of_Passage, "to", df_table$Purification_Cleansing)

# Load ggplot2 for creating the bar graph
library(ggplot2)

# Create the bar plot
ggplot(df_table, aes(x = Combination, y = Count, fill = Combination)) +
  geom_bar(stat = "identity") +  # Use stat = "identity" because we already have counts
  labs(x = "Yes/No Combinations", y = "Count", title = "Counts of Yes/No Combinations (First 63 Rows)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  guides(fill = "none")  # Remove the legend since we already have the labels on the x-axis
