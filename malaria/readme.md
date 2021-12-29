# Introduction

This repository was created to visualize time series trends for [3 malaria datasets](https://github.com/rfordatascience/tidytuesday/tree/master/data/2018/2018-11-13) using both python and R. 



The initial exploration of the 3 datasets and considerations for preprocessing was done in python, and can be found in the jupyter notebook [`Python_1_EDA_malaria.ipynb`](analysis/Python_1_EDA_malaria.ipynb). 

- The Python data pipeline script for the preprocessing steps can be found in [`main.py`](src/python/main.py) (`src > python > main.py`). This script uses the dependent scripts [`malaria_custom_preprocessor.py`](src/python/lib/malaria_custom_preprocessor.py) and [`utils.py`](src/python/lib/utils.py) in the `src > python > lib` folder. 
- The R data pipeline script for the ingestion and preprocessing steps can be found in [main.R](src/R/main.R) (`src > R > main.R`). This script uses the dependent script [`helper_functions.R`](src/R/helper_functions.R) in the `src > R` folder. 
  - Cleaning and validation of the data preprocessing steps in R can be found in the RMarkdown file [`RMarkdown_1_preprocessing_malaria.Rmd`](analysis/RMarkdown_1_preprocessing_malaria.Rmd).

> Note that for both pipeline scripts, the working directory to launch the main pipeline script is the malaria folder (i.e. `projects > malaria`) of this `projects` Github repository



## Data visualization  

Data visualization for the 3 malaria datasets can be found in their respective files:

- python implementation: [`Python_2_EDA_visualisation.ipynb`](analysis/Python_2_EDA_visualisation.ipynb)
- R implementation: [`RMarkdown_2_EDA_malaria.Rmd`](analysis/RMarkdown_2_EDA_malaria.Rmd), and the [rendered html](https://htmlpreview.github.io/?https://github.com/py3lee/projects/blob/main/malaria/analysis/RMarkdown_2_EDA_malaria.html).
- You can also visualize the number of malaria deaths across the years via this web [app](https://malariadatasets.herokuapp.com). The source code for the app is available in this [repository](https://github.com/py3lee/malariaapp). 



# Primary problem statement

Is there any observable trend on the incidence of malaria and malaria-related deaths over the years?



## Dataset

Data Source: https://github.com/rfordatascience/tidytuesday/tree/master/data/2018/2018-11-13

3 Datasets:

- malaria_inc.csv - Malaria incidence by country for all ages across the world across time
- malaria_deaths.csv - Malaria deaths by country for all ages across the world and time.
- malaria_deaths_age.csv - Malaria deaths by age across the world and time.

note: unable to trace exact original data sources based on the data provided at https://github.com/rfordatascience/tidytuesday/tree/master/data/2018/2018-11-13.



## Dataset limitations

- The current limitations of this dataset (and this current analyses) are related to the data sources. Since the original data dictionary and original raw data sources was unable to be determined, we had to make assumptions on the representation of the values in the dataset.

  

## Assumptions in current analyses

- Assumptions in this current analysis

  - Deaths are attributed to malaria,

  - The ‘Code’ variable in the datasets represent the [3 letter ISO 3166-1 alpha-3 country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3),

  - SDI refers to [‘Socio-demographic Index’](http://ghdx.healthdata.org/record/ihme-data/gbd-2015-socio-demographic-index-sdi-1980–2015), which is a summary measure of a geography’s socio-demographic development. It is based on average income per person, educational attainment, and total fertility rate (TFR).

  - [Malaria incidence rate (per 1 000 population at risk)](https://www.who.int/data/gho/indicator-metadata-registry/imr-details/4670): refers to the number of malaria cases per 1000 population at risk per year. Population at risk is defined as population living in arease where malaria transmission occurs.

  - The composite variables/metrics in the current datasets, `'Deaths - Malaria - Sex: Both - Age: Age-standardized (Rate) (per 100,000 people)'` and `'Incidence of malaria (per 1,000 population at risk) (per 1,000 population at risk)'`, were calculated with minimal error and are an accurate representation of the age-standardised malaria death rate (per 100,000 people) and malaria incidence (per 1,000 people) per year respectively.

  - The baseline population estimates used for the calculation of composite metrics `'Deaths - Malaria - Sex: Both - Age: Age-standardized (Rate) (per 100,000 people)'` and `'Incidence of malaria (per 1,000 population at risk) (per 1,000 population at risk)'` were based on the same population estimates for that particular entity/country for that particular year

    

## Limitations of current analyses

- An important limitation of the current analyses is that the original data sources were not able to be cross-validated.
- Any preprocessing steps done prior to the 3 datasets retrieved from the [Github repo](https://github.com/rfordatascience/tidytuesday/tree/master/data/2018/2018-11-13) are also not known.
- The definitions of malaria, case incidence of malaria and deaths attributable to malaria is also not known.
- More importantly, the exact calculation of the composite metrics `'Deaths - Malaria - Sex: Both - Age: Age-standardized (Rate) (per 100,000 people)'` and `'Incidence of malaria (per 1,000 population at risk) (per 1,000 population at risk)'` is not known, and therefore it would be difficult to estimate or quantify the errors contained within this analysis.

In light of the limitations of the current analyses, statistical testing in this current analyses might lead to erroneous conclusions. This would be due to the lack of validation of the original data sources as well as the lack of understanding on how the composite metrics were determined. Statistical testing would therefore not be conducted for this current analyses.



# Considerations to improve the current analyses



- **Understanding what was the extent to which the observed trends in malaria incidence and malaria deaths over time could be attributed to better reporting and better malaria diagnosis methods.**
  
  - From the visualizations of the regional trends and visualizations by income/demographic groups, a disproportionate number of deaths and malaria incidence occur in Africa or in poor/low income countries.  
  - The healthcare resources available in these countries are not known, but is likely to be limited.  
  - From [previous literature](https://www.thelancet.com/journals/lancet/article/PIIS0140-6736(18)30324-6/fulltext), the gold standard for malaria diagnosis involves microscopy analyses of stained blood films. However, rapid diagnostic kits are used for first-line investigation.
  - These [rapid diganostic kits emerged in the early 1990s](https://malariajournal.biomedcentral.com/articles/10.1186/s12936-019-3028-z) but had variable field performance.
  - The [WHO malaria rapid diagnostic test product testing programme only started in 2008](https://malariajournal.biomedcentral.com/articles/10.1186/s12936-019-3028-z) to evaluate the performance of such rapid diagnostic kits.  
  - Some papers have postulated that the [observed increase in malaria cases are associated with improved diagnostic availability rather than a resurgence of malaria in those areas.](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6658057). 
  - In this current analyses, just purely visualizing the trends of malaria incidence and malaria deaths over time without additional information on how the information and composite metrics were derived could result in erroneous conclusions. 
  - Therefore, understanding and quantifying the extent to which the observed trends in malaria incidence and malaria deaths over time could be attributed to better reporting and better malaria diagnosis methods would be able to improve the current analyses. 
  
  
  
- **Determining if the observed trends were statistically significant would reduce the risk of erroneous inferences from the observed trends.**
  - In this current analyses, the exact calculation of the composite metrics `'Deaths - Malaria - Sex: Both - Age: Age-standardized (Rate) (per 100,000 people)'` and `'Incidence of malaria (per 1,000 population at risk) (per 1,000 population at risk)'` was not known
  - There was also a lack of validation of the original data sources
  - It is likely that the [malaria incidence numbers](https://www.who.int/data/gho/indicator-metadata-registry/imr-details/4670) and [malaria death rates](https://www.who.int/data/gho/indicator-metadata-registry/imr-details/16) in the 3 datasets (of which this analysis was based on) were already adjusted estimates instead of actual reported numbers.
  - Statistical testing was therefore not conducted to reduce the risk of any erroneous conclusions.
  - Only visualizations were done, and observable trends were commented on.

  

- **If the [malaria incidence numbers](https://www.who.int/data/gho/indicator-metadata-registry/imr-details/4670) and [malaria death rates](https://www.who.int/data/gho/indicator-metadata-registry/imr-details/16) in the 3 datasets (of which this analysis was based on) were indeed point estimates instead of actual reported numbers, the visualizations would be improved if the line charts also contained the 95% confidence intervals, to quantify the level of uncertainty in the visualized trends**.



- **If the mappings of the categories to the aggregate groups are known (for example, the exact countries included in countries categorized as 'Low SDI'), then we can also visualize percentage contributions of each country in the time series charts.** 



- **The current analyses can be improved by improving the utility of the problem statement to answer specific questions that have social/economic/policy-related implications. Further data can then be gathered and analyses conducted to address the problem statement.**

  

  - Possible questions could be:
    - Did the implementation of a particular malaria prevention program in a particular region/country have any impact on the malaria incidence or number of malaria deaths in that particular region for that particular time period?
    - Did the provision of insecticide-treated mosquito nets, indoor residual spraying and other vector control measures for a particular region at a particular point in time have any impact on the malaria incidence on that region for that time period?