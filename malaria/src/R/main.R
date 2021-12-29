#!/usr/bin/env Rscript

# Check if required packages are in the list of installed packages. if not, to install the new packages. 
list_of_packages <- c("dplyr")
new_packages <- list_of_packages[!(list_of_packages %in% installed.packages()[,"Package"])]
if(length(new_packages)) install.packages(new_packages)

library(dplyr)

# Load configuration variables 
source("config/config.R")

# Load helper functions 
source("src/R/helper_functions.R")

# main pipeline function to ingest, preprocess the csv files and save processed csv files
main<- function(){
  
  # read csv files from urls stated in configuration files 
  deaths<- read_csv_from_url(deaths_url)
  deaths_age<- read_csv_from_url(deaths_age_url)
  inc<- read_csv_from_url(inc_url)
  
  deaths<-preprocess(deaths)
  deaths_age<-preprocess(deaths_age)
  inc<-preprocess(inc)
  
  # save as csv files 
  write.csv(deaths, clean_deaths_path, row.names = FALSE)
  write.csv(deaths_age, clean_deaths_age_path, row.names = FALSE)
  write.csv(inc, clean_inc_path, row.names = FALSE)
  
}

if (!interactive()) {
  main()
}