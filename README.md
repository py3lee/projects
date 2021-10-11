

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

  

I'm still working on adding content to this repository.

Any comments, feedback and suggestions for improvement are welcome - please do drop me a message!  



Thank you! 