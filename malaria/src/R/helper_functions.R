# read csv from github url stated in the configuration file
read_csv_from_url<- function(url) {
  
  tryCatch(
    expr = {
      
      dataframe<- read.csv(
        url, 
        na.strings=c("NA","NaN", " ", "")
      )
      
      log_info(paste('Successfully read csv from url: ', url))
      
      return(dataframe)
    },
    error = function(e){ 
      
      log_info(paste('Error reading csv from url: ', url))
      
    }
  )
}

# set_entity_type: function to set the entity_type based on multiple conditions: 
# if entity is 'World', set entity_type to 'World, 
# if code is not na, set entity_type to 'Country',
# if code is na and entity contains the characters 'SDI', set entity_type as 'SDI',
# if code is na and entity contains a list of income/demographic terms, set entity)type as 'Income/Demographic'

set_entity_type <- function(dataframe, income_demo) {
  
  dataframe <- dataframe  %>% mutate(entity_type = case_when(
    
    dataframe$entity == 'World' ~ 'World',
    !is.na(dataframe$code) ~ 'Country',
    is.na(dataframe$code) & grepl('SDI', dataframe$entity) ~ 'SDI',
    is.na(dataframe$code) & dataframe$entity %in% income_demo ~ 'Income/Demographic',
    TRUE ~ 'Region' # else statement
  ))
  
  return(dataframe)
}

# set_uk_code: function to set code as 'GBR' if code is na and if the entity contains the terms in uk_entity list
set_uk_code <- function(dataframe, uk_entity) {
  
  dataframe[(is.na(dataframe$code)) & (dataframe$entity %in% uk_entity), 
            "code"] <- 'GBR'
  
  return(dataframe)
}

# rename specific column names
rename_specific_cols<- function(dataframe){
  
  if (
    'deaths...malaria...sex..both...age..age.standardized..rate...per.100.000.people.' %in% colnames(dataframe)
  ) {
    
    dataframe <- rename(
      dataframe, 
      age_std_death_rate = deaths...malaria...sex..both...age..age.standardized..rate...per.100.000.people.
    )
  }
  
  else if (
    'incidence.of.malaria..per.1.000.population.at.risk...per.1.000.population.at.risk.' %in% colnames(dataframe)
  ) {
    dataframe <- rename(
      dataframe,
      malaria_incidence_1000 = incidence.of.malaria..per.1.000.population.at.risk...per.1.000.population.at.risk.
    )
  }
  
  return (dataframe)
  
}

# drop row index if present 
drop_row_index <-function(dataframe){
  
  if ('X' %in% colnames(dataframe)){
    
    dataframe <- subset(dataframe, select = -c(X))
    
  }
  return(dataframe)
}

# main preprocessing function to preprocess the 3 dataframes
preprocess<- function(dataframe){
  
  clean_dataframe<- dataframe %>%
    drop_row_index() %>%
    rename_all(tolower) %>%
    rename_specific_cols() %>%
    set_uk_code(., uk_entity) %>%
    set_entity_type(., income_demo)
  
  return(clean_dataframe)
}