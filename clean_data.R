library(tidyverse)
raw<-read_csv("usa_00001.csv")

doctoral_degree_code <- 116 

state_edu_data <- raw %>%
  filter(EDUCD == doctoral_degree_code) %>%   # Filter for rows where EDUC equals the doctoral degree code
  group_by(STATEICP) %>%                     # Group by STATEICP (state code)
  summarise(respondents = n()) %>%           # Count the number of respondents per state
  arrange(desc(respondents))                 # Sort in descending order
write_csv(state_edu_data,"cleaned_data.csv")

