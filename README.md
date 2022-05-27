

# Projects

Here you'll find my previous projects organized into their respective folders.  



## Supervised Model Dashboard

Artificial intelligence and machine learning are buzzwords within healthcare nowadays. However, not enough people within the industry appreciate that it takes a combination of clinical research evidence, good quality large-scale datasets and machine learning technologies with the associated software infrastructure for us to harness the benefits of technology within healthcare.  Technology has to be utilized with the right intention and with the right systems in place for an appropriate problem statement. 



Even if the prerequisite blocks are in place, someone would still need to explore the quality of the dataset and establish a baseline machine learning model to determine whether supervised machine learning would be feasible for a current problem statement. These prerequisite blocks include an appropriate problem statement that can be addressed by machine learning, having datasets in an appropriate format (i.e. tabular datasets) with sufficient quality and quantity, as well as the underlying clinical research evidence for the predictors included in the model. 

![](supervised_ml_dashboard/user_guide/_static/sup_dashbrd/model_feasibility.png)



The [Supervised Model Dashboard](supervised_ml_dashboard) was designed to provide some guidance to the question "Will supervised machine learning be feasible for this problem statement?".  Given an existing preprocessed/cleaned tabular dataset and an appropriate predictive modelling problem statement, it allows a user to quickly assess if a dataset is suitable for supervised machine learning; it can train and then display the evaluation results of a selected baseline supervised machine learning model and provide some explanations for the model predictions. 



### Quick summary

- The Dashboard is run from a jupyter notebook and the display is rendered via voila. 

- The user can choose to either (1) train and evaluate a supervised machine learning model using a selected model type, or (2) load and evaluate a pre-trained model. 
- In both cases, the Dashboard will display the model performance scores, predicted samples, feature importance scores and bivariate plots of the target and the features within tabs in the Dashboard. 
- The [repository](supervised_ml_dashboard) contains the source code for the custom python pipeline scripts required to display the Supervised Model Dashboard. These include pipeline scripts to ingest and preprocess a raw dataset, use the preprocessed dataset for supervised machine learning, and to display the modelling results using jupyter widgets in a voila dashboard. 
- For more details on the Dashboard, please see the [user guide](http://htmlpreview.github.io/?https://github.com/py3lee/projects/blob/main/supervised_ml_dashboard/user_guide/Supervised%20Model%20Dashboard.html)



You can also find a series of [EDA notebooks](supervised_ml_dashboard/notebook/EDA) which detail the rationale and considerations for each of the steps undertaken in the `CustomIngestor` and `CustomPreprocessor` pipeline scripts. 

- This series of jupyter notebooks cover each step of the pipeline - from ingestion of raw datasets till baseline model construction. 
- This demo example was based on the [Vaccine Adverse Event Reporting System datasets](https://vaers.hhs.gov/data.html).



---



## Robotic Process Automation (RPA)

Robotic Process Automation, or [RPA](https://en.wikipedia.org/wiki/Robotic_process_automation), is a type of software technology that helps to automate repetitive tasks.  It is useful for any repetitive computer-related task that is based on known rules, and which can be broken down or operationalized into a series of steps. RPA can be helpful to automate repetitive tasks related to the use of legacy software systems that are entrenched within the company culture, and too expensive to change. 



A single tool alone is sometimes insufficient to solve a problem. By combining a [free RPA tool](https://aisingapore.org/tagui/) with other python packages, we can leverage on existing python packages to process excel files, read passwords from Windows Credentials, or send email alerts when a certain specified price threshold is reached. All this can be packaged into a simple program that can be trigged by Windows Task Scheduler at set times -  an unattended RPA bot. 



Can we leverage on technology to minimize the repetitive computer-related administrative work in healthcare, so that we can focus our time on our patients instead? 



### Quick Summary 

- See my [notebook](rpa/notebook/Example_rpa_use_case.ipynb) for a simple example on how to use a free tool ([TagUI](https://aisingapore.org/tagui/)) to automate the download of financial asset data.

  - The notebook also includes:

    - the initial data exploration of the downloaded csv data for two (2) financial assets, Bitcoin and GLDM (a gold-backed exchange traded fund), 

    - justification for each step of the data processing pipeline detailed in the [`CustomPreprocessor`](rpa/src/lib/custom_preprocessor.py) python script.  

      

- To showcase the integration of RPA with other python packages, I've also created [Your Friendly (mini) Financial bot](rpa), a program to automatically download financial asset data and preprocess them into an excel chart for easy comparison between different financial assets. 

  - Designed for the value investor, this program can be scheduled to run weekly or fortnightly using Windows Task Scheduler - and prompt the investor to review his/her financial portfolio when the indexed prices fall below a certain price threshold. 
  - This friendly bot comes without hefty financial fees, and can be customized to the investor's needs.  



---



## Data analysis and visualization 

- [Malaria](https://github.com/py3lee/projects/tree/main/malaria): Data analysis and visualization, data pipeline construction in python and R using 3 malaria datasets
  - [Dash app](https://github.com/py3lee/malariaapp) built to visualize the malaria datasets
- [Google Analytics Capstone Case Study](https://github.com/py3lee/google_analytics_capstone) : Data analysis and visualization in R using the 2021 public Chicago [Divvy Bicycle Sharing data](https://divvy-tripdata.s3.amazonaws.com/index.html)



---



## Online calculator 

[Model-based Physical Frailty Phenotype](https://py3lee.shinyapps.io/frailty_shiny/), an online calculator created using the R Shiny framework.

---



I'm still working on adding content to this repository.

Any comments, feedback and suggestions for improvement are welcome - please do drop me a message!  



Thank you! 