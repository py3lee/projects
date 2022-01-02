#!/usr/bin/env Rscript

# Check if required packages are in the list of installed packages. if not, to install the new packages. 
list_of_packages <- c("tidyverse", "logger")
new_packages <- list_of_packages[!(list_of_packages %in% installed.packages()[,"Package"])]
if(length(new_packages)) install.packages(new_packages)

library(tidyverse)
library(logger)

# Load configuration variables 
source("config/config.R")

# Load helper functions 
source("src/R/helper_functions.R")
source("src/R/check_pipe.R")

# main pipeline function to ingest, preprocess the csv files and save processed csv files
main<- function(){
  
  # logging information to a log file in 'logs' folder
  today<- Sys.Date()
  log_filepath<- paste('logs/malaria_log_', today, '.log')
  log_appender(appender_file(log_filepath))
  
  # read csv files from urls stated in configuration files 
  deaths<- read_csv_from_url(deaths_url)
  deaths_age<- read_csv_from_url(deaths_age_url)
  inc<- read_csv_from_url(inc_url)
  
  deaths_clean<-preprocess(deaths)
  deaths_age_clean<-preprocess(deaths_age)
  inc_clean<-preprocess(inc)
  
  check_deaths_process(deaths, deaths_clean)
  check_deaths_age_process(deaths_age, deaths_age_clean)
  check_inc_process(inc, inc_clean)
  
  # save as csv files 
  write.csv(deaths_clean, clean_deaths_path, row.names = FALSE)
  write.csv(deaths_age_clean, clean_deaths_age_path, row.names = FALSE)
  write.csv(inc_clean, clean_inc_path, row.names = FALSE)
  
}

if (!interactive()) {
  main()
}