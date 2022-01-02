check_na <- function(pre_df, post_df){
  
  cat('\nBefore preprocessing:')
  print('Number of NAs in dataset:')
  print(
    cbind(
      lapply(
        lapply(post_df, is.na)
        , sum)
    )
  )
  
  cat('\nAfter processing:')
  print('Number of NAs in dataset:')
  print(
    cbind(
      lapply(
        lapply(post_df, is.na)
        , sum)
    )
  )
}

glimpse_dfs<- function(pre_df, post_df){
  
  cat('\nBefore preprocessing:')
  glimpse(pre_df)
  
  cat('\nAfter processing:')
  glimpse(post_df)
}

# check if column values of 2 dataframes are identical
are_col_values_identical<- function(
  df1, 
  df2, 
  col_name1, 
  col_name2
){
  
  log_info(
    '\nAre the values in {deparse(substitute(df1))} {col_name1} identical to {deparse(substitute(df2))} {col_name2}?'
  )
  log_info(
    identical(
      df1[[col_name1]], 
      df2[[col_name2]]
    )
  )
}

check_gbr <- function(pre_df, post_df){
  
  cat('\nNumber of rows with code GBR and their entity names:\n')
  
  print(
    post_df %>% 
    filter(code == 'GBR') %>%
    select(c(code, entity)) %>%
    table()
  )
}

check_entity_type<- function(pre_df, post_df){
  
  cat('\nNumber of rows for each entity_type:\n')
  print(table(post_df['entity_type']))
  
}

check_deaths_process <- function(pre_df, post_df){
  
  log_info(
    "\n#### Checking {deparse(substitute(pre_df))} and {deparse(substitute(post_df))}:####\n"
  )
  
  check_na(pre_df, post_df)
  
  glimpse_dfs(pre_df, post_df)
  
  are_col_values_identical(
    pre_df, 
    post_df,
    'Entity',
    'entity'
  )

  check_gbr(pre_df, post_df)
  
  are_col_values_identical(
    pre_df, 
    post_df,
    'Year',
    'year'
  )
  
  are_col_values_identical(
    pre_df, 
    post_df,
    'Deaths...Malaria...Sex..Both...Age..Age.standardized..Rate...per.100.000.people.',
    'age_std_death_rate'
  )

  check_entity_type(pre_df, post_df)
  
}

check_deaths_age_process <- function(pre_df, post_df){
  
  log_info(
    "\n#### Checking {deparse(substitute(pre_df))} and {deparse(substitute(post_df))}: #### \n"
  )
  
  check_na(pre_df, post_df)
  glimpse_dfs(pre_df, post_df)
  
  are_col_values_identical(
    pre_df, 
    post_df,
    'entity',
    'entity'
  )

  check_gbr(pre_df, post_df)
  
  are_col_values_identical(
    pre_df, 
    post_df,
    'year',
    'year'
  )
  
  are_col_values_identical(
    pre_df, 
    post_df,
    'age_group',
    'age_group'
  )
  
  check_entity_type(pre_df, post_df)
  
}

check_inc_process <- function(pre_df, post_df){
  
  log_info(
    "\n#### Checking {deparse(substitute(pre_df))} and {deparse(substitute(post_df))}: #### \n"
  )
  
  check_na(pre_df, post_df)
  glimpse_dfs(pre_df, post_df)
  
  are_col_values_identical(
    pre_df, 
    post_df,
    'Entity',
    'entity'
  )
  
  are_col_values_identical(
    pre_df, 
    post_df,
    'Code',
    'code'
  )
  
  are_col_values_identical(
    pre_df, 
    post_df,
    'Year',
    'year'
  )
  
  are_col_values_identical(
    pre_df, 
    post_df,
    'malaria_incidence_1000',
    'Incidence.of.malaria..per.1.000.population.at.risk...per.1.000.population.at.risk.'
  )
  
  check_entity_type(pre_df, post_df)
  
}