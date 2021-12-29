# dataset url

deaths_url<- c('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2018/2018-11-13/malaria_deaths.csv')
deaths_age_url<- c('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2018/2018-11-13/malaria_deaths_age.csv')
inc_url <- c('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2018/2018-11-13/malaria_inc.csv')

# processed filepaths
clean_deaths_path<-c('data/processed/R/pipe/malaria_deaths_processed.csv')
clean_deaths_age_path<-c('data/processed/R/pipe/malaria_deaths_age_processed.csv')
clean_inc_path<-c('data/processed/R/pipe/malaria_inc_processed.csv')

# set variables to be used by the functions 

uk_entity <- c(
  'Wales', 
  'England', 
  'Scotland', 
  'Northern Ireland', 
  'United Kingdom'
)

income_demo <- c(
  'Fragile and conflict affected situations',
  'Heavily indebted poor countries (HIPC)',
  'Late-demographic dividend',
  'Least developed countries: UN classification',
  'Low & middle income', 
  'Low income', 
  'Lower middle income',
  'Middle income',
  'Pre-demographic dividend',
  'Upper middle income'
)