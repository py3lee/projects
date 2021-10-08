# Projects

Here you'll find my previous projects organised into their respective folders.  

The [Supervised Model Dashboard](supervised_ml_dashboard) is a voila dashboard displayed from a jupyter notebook. This dashboard was designed to display the evaluation results of a baseline machine learning model, and explain some of the model predictions. This can then allow the user to quickly assess if a dataset is suitable for modelling.
- The user can choose to either (1) train and evaluate a supervised machine learning model using a selected model type, or (2) load and evaluate a pre-trained model. 
- In both cases, the Dashboard will display the model performance scores, predicted samples, feature importances and bivariate plots of the target and the features within tabs in the Dashboard. 
- The [repository](supervised_ml_dashboard) contains the source code for the custom python pipeline scripts required to display the Supervised Model Dashboard. These include pipeline scripts to ingest and preprocess a raw dataset, use the preprocessed dataset for supervised machine learning modelling, and to display the results using jupyter widgets in a voila dashboard. 
- For more details on the Dashboard, please see the [user guide](http://htmlpreview.github.io/?https://github.com/py3lee/projects/blob/main/supervised_ml_dashboard/user_guide/Supervised%20Model%20Dashboard.html)

You can also find a series of [EDA notebooks](supervised_ml_dashboard/notebook/EDA) which detail the rationale and considerations for each of the steps undertaken in the `CustomIngestor` and `CustomPreprocessor` pipeline scripts. 
- This series of jupyter notebooks cover each step of the pipeline - from ingestion of raw datasets till baseline model construction. 

I'm still working on adding content to this repository.

Any comments, feedback and suggestions for improvement are welcome - please do drop me a message!  

Thank you! 