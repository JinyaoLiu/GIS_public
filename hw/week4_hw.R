library(tidyverse)
library(here)
library(sf)
library(janitor)
library(tmap)

index <- read_csv(here::here("hw", "HDR21-22_Composite_indices_complete_time_series.csv"),
                   na= "NULL")

shape <- st_read(here::here("hw", "World_Countries_Generalized", "World_Countries_Generalized.shp"))

useful_data <- index %>%
  select(matches(c("country", "gii_2010", "gii_2019"))) %>%
  mutate(difference = gii_2019 - gii_2010)

joined_data <- shape %>% 
  clean_names(.) %>%
  left_join(., 
            useful_data,
            by = c("country" = "country"))

