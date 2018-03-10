# Map of average travel time from home to work in Philadelphia, 2013-2016.
# I used tidycensus package to get data.

setwd("C:/Users/zhaoa/Documents/GitHub/MUSA-620-Week-1")

library(tidyverse)
library(tidycensus)
library(viridis)
library(ggplot2)
library(ggmap)

#Get api key
Sys.getenv("CENSUS_API_KEY")
census_api_key("37cf967b2690f567612a67e3cfe355f149fa340b", overwrite = TRUE, install = TRUE)
# First time, relead your environment so you can use the key without restarting R.
readRenviron("~/.Renviron")
# You can check it with:
Sys.getenv("CENSUS_API_KEY")
v15 <- load_variables(2016, "acs5", cache = TRUE)## Load variable list

# request variable
Trv16<-get_acs(state = "PA", county = "Philadelphia", geography = "tract", year = 2016,
                   variables = "B08303_001E", geometry = TRUE)
Trv15<-get_acs(state = "PA", county = "Philadelphia", geography = "tract", year = 2015,
             variables = "B08303_001E", geometry = TRUE)
Trv14<-get_acs(state = "PA", county = "Philadelphia", geography = "tract", year = 2014,
             variables = "B08303_001E", geometry = TRUE)
Trv13<-get_acs(state = "PA", county = "Philadelphia", geography = "tract", year = 2013,
             variables = "B08303_001E", geometry = TRUE)
#change column name
colnames(Trv13)[4] <- "T13"
colnames(Trv14)[4] <- "T14"
colnames(Trv15)[4] <- "T15"
colnames(Trv16)[4] <- "T16"

#plot variables
Trv16 %>%
  ggplot(aes(fill = T16)) + 
  labs(title="Travel time from home to work, Pennsylvania") +
  geom_sf() + 
  coord_sf(crs = 26911) + 
  scale_fill_viridis("2016",limits = c(0,3000),option = "plasma") 

options(tigris_use_cache = TRUE)

Trv15 %>%
  ggplot(aes(fill = T15)) + 
  labs(title="Travel time from home to work, Pennsylvania") +
  geom_sf() + 
  coord_sf(crs = 26911) + 
  scale_fill_viridis("2015",limits = c(0,3000),option = "plasma") 

Trv14 %>%
  ggplot(aes(fill = T14)) + 
  labs(title="Travel time from home to work, Pennsylvania") +
  geom_sf() + 
  coord_sf(crs = 26911) + 
  scale_fill_viridis("2014",limits = c(0,3000),option = "plasma") 

Trv13 %>%
  ggplot(aes(fill = T13)) + 
  labs(title="Travel time from home to work, Pennsylvania") +
  geom_sf() + 
  coord_sf(crs = 26911) + 
  scale_fill_viridis("2013",limits = c(0,3000),option = "plasma") 


