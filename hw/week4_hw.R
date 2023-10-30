library(tidyverse)
library(here)
library(sf)
library(janitor)
library(tmap)

index <- read_csv(here::here("hw", "HDR21-22_Composite_indices_complete_time_series.csv"),
                   na= "NULL")

shape <- st_read(here::here("hw", "World_Countries_Generalized", "World_Countries_Generalized.shp"))

temp <- index %>%
  select(matches(c("country", "gii")))

useful_data <- temp[c(1,23:32)]



joined_data <- shape %>% 
  clean_names(.) %>%
  left_join(., 
            useful_data,
            by = c("country" = "country"))
