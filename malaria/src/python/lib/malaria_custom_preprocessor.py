##########
# Built-in
##########
import glob
import logging
from pathlib import Path
from typing import Dict

########
# Libs #
########
import pandas as pd

logger = logging.getLogger(__name__)

class CustomPreprocessor():

    def __init__(self, cfg: object):
        """Custom preprocessor for malaria datasets at 
        https://github.com/rfordatascience/tidytuesday/tree/master/data/2018/2018-11-13.

        :param cfg: python configuration file imported as a module
        :type cfg: module object
        """
        # attributes from python configuration file
        self.folder_path = getattr(cfg, "DATA_FOLDER_RELATIVE_PATH", None)
        self.rename_dict = getattr(cfg, "RENAME_DICT", None)
        self.uk_list = getattr(cfg, "UK_LIST", None)
        self.income_demo = getattr(cfg, "INCOME_DEMO", None)
        
    ##################
    # Helper functions
    ##################

    def get_df_list(self, folder_path: str) -> list:
        """Get a list of csv filepaths to load as DataFrames

        :param folder_path: relative file path to raw data folder containing csv files
        :type folder_path: str
        :return: a list of absolute filepaths to load as DataFrames
        :rtype: list
        """
        full_folder_path = Path(__file__).parents[3] / folder_path

        df_list = [
            file 
            for file in glob.glob(
                f'{full_folder_path}/*.csv'
                )
        ]
        return df_list

    def get_entity_type(
        self,
        code: str, 
        entity: str, 
        income_demo: list
    )-> str:
        """Get entity type value for each row based on multiple conditions

        :param code: 'code' column value in the dataframe indicating country code for that row
        :type code: str
        :param entity: 'entity' column value in the dataframe indicating entity for that row
        :type entity: str
        :param income_demo: list of entities to be categorized under 'Income/Demographic' entity_type
        :type income_demo: list
        :return: value for entity_type for that row
        :rtype: str
        """
        if entity == 'World':
            entity_type = 'World'

        elif not pd.isnull(code):
            entity_type = 'Country'

        elif pd.isnull(code) and 'SDI' in entity:
            entity_type = 'SDI'

        elif pd.isnull(code) and entity in income_demo:
            entity_type = 'Income/Demographic'

        else:
            entity_type = 'Region'

        return entity_type
    
    ################
    # Core functions
    ################

    def read_csvs(self, df_list: list) -> pd.DataFrame:
        """Read a list of csv filepaths as pandas DataFrames

        :param df_list: a list of absolute filepaths to load as DataFrames
        :type df_list: list
        :return: 
            deaths (pd.DataFrame): raw DataFrame from malaria_deaths.csv
            deaths_age (pd.DataFrame): raw DataFrame from malaria_deaths_age.csv
            inc (pd.DataFrame): raw DataFrame from malaria_inc.csv
        :rtype: pd.DataFrame
        """
 
        for file_path in df_list:

            if 'malaria_deaths.csv' == Path(file_path).name:
                deaths = pd.read_csv(file_path)

            elif 'malaria_deaths_age.csv' == Path(file_path).name:
                deaths_age = pd.read_csv(file_path)
            
            elif 'malaria_inc.csv' == Path(file_path).name:
                inc = pd.read_csv(file_path)
            
            else:
                logger.info('Unknown files in directory path - please check')

        return deaths, deaths_age, inc

    def create_entity_type_column(
        self,
        df: pd.DataFrame, 
        income_demo: list
    ) -> pd.DataFrame:
        """Create entity_type column in a dataframe by applying the helper function get_entity_type to each row

        :param df: pandas dataframe to create entity_type column
        :type df: pd.DataFrame
        :param income_demo: list of entities to be categorized under 'Income/Demographic' entity_type
        :type income_demo: list
        :return: pandas dataframe to with entity_type column
        :rtype: pd.DataFrame
        """
        
        df['entity_type'] = df.apply(
            lambda x: self.get_entity_type(
                x['code'], 
                x['entity'],
                income_demo = income_demo
            ), 
            axis=1
        )
        return df

    def fill_uk_code(
        self,
        df: pd.DataFrame, 
        uk_list: list
    ) -> pd.DataFrame:
        """Fill missing country code values for UK entities in the dataframe as 'GBR'

        :param df: pandas dataframe with missing country codes for UK entities
        :type df: pd.DataFrame
        :param uk_list: list of UK entities
        :type uk_list: list
        :return: pandas dataframe with missing country codes for UK entities filled as 'GBR'
        :rtype: pd.DataFrame
        """
        df.loc[
            (df.code.isnull() & df.entity.isin(uk_list)),
            "code"
        ] = "GBR"
        
        return df

    def lowercase_columns(self, df: pd.DataFrame) -> pd.DataFrame:
        """Lowercase column names in a dataframe

        :param df: raw pandas dataframe
        :type df: pd.DataFrame
        :return: pandas dataframe with column names lowercased
        :rtype: pd.DataFrame
        """
        df.columns = df.columns.str.lower()
        
        return df

    def rename_columns(
        self, 
        df:pd.DataFrame, 
        rename_dict:dict
    )->pd.DataFrame:
        """Rename specific column names as stated in the rename_dict in the configuration file

        :param df: pandas dataframe with column names lowercased
        :type df: pd.DataFrame
        :param rename_dict: dictionary with the following key-value pairs:
          - key: original column name that has been lowercased
          - value: renamed column name
        :type rename_dict: dict
        :return: pandas dataframe with specific column names renamed
        :rtype: pd.DataFrame
        """
        for key, value in rename_dict.items():
            
            if key in df.columns:
            
                df.rename(
                    columns = {key : value},
                    inplace = True
                )

        return df

    ###############
    # main function
    ###############

    def run(self):
        """Runs all functions to ingest and preprocess datasets

        :return: 
            deaths (pd.DataFrame): processed DataFrame from malaria_deaths.csv
            deaths_age (pd.DataFrame): processed DataFrame from malaria_deaths_age.csv
            inc (pd.DataFrame): processed DataFrame from malaria_inc.csv
        :rtype: pd.DataFrame
        """

        df_list = self.get_df_list(self.folder_path)
        logger.debug(df_list)

        deaths, deaths_age, inc = self.read_csvs(df_list)
        logger.debug('#'*10 + ' BEFORE PREPROCESSING ' + '#'*10)
        logger.debug(f"malaria_deaths.csv: {deaths.info()}")
        logger.debug(f"malaria_deaths_age.csv: {deaths_age.info()}")
        logger.debug(f"malaria_inc.csv: {inc.info()}")

        # malaria_deaths.csv processing
        deaths = self.lowercase_columns(deaths)
        deaths = self.rename_columns(deaths, self.rename_dict)
        deaths = self.fill_uk_code(deaths, self.uk_list)
        deaths = self.create_entity_type_column(deaths, self.income_demo)

        # malaria_deaths_age.csv processing
        deaths_age = deaths_age.drop(columns = ['Unnamed: 0']) # drop row index
        deaths_age = self.fill_uk_code(deaths_age, self.uk_list)
        deaths_age = self.create_entity_type_column(
            deaths_age, 
            self.income_demo
        )

        # malaria_inc.csv processing
        inc = self.lowercase_columns(inc)
        inc = self.rename_columns(inc, self.rename_dict)
        inc = self.fill_uk_code(inc, self.uk_list)
        inc = self.create_entity_type_column(inc, self.income_demo)

        # post processing check
        logger.debug('#'*10 + ' AFTER PREPROCESSING ' + '#'*10)
        logger.debug(f"malaria_deaths.csv post processing: {deaths.info()}")
        logger.debug(f"malaria_deaths_age.csv post processing: {deaths_age.info()}")
        logger.debug(f"malaria_inc.csv post processing: {inc.info()}")

        # save processed csv files
        processed_folder = Path(__file__).parents[3] / self.folder_path
        deaths.to_csv(
            f"{processed_folder}/processed/malaria_deaths_processed.csv", 
            index=False
        )
        logger.info(
            f"File saved: {processed_folder}/processed/malaria_deaths_processed.csv"
        )
        deaths_age.to_csv(
            f"{processed_folder}/processed/malaria_deaths_age_processed.csv", 
            index=False
        )
        logger.info(
            f"Filed saved: {processed_folder}/processed/malaria_deaths_age_processed.csv"
        )
        inc.to_csv(
            f"{processed_folder}/processed/malaria_inc_processed.csv", 
            index=False
        )
        logger.info(
            f"File saved: {processed_folder}/processed/malaria_inc_processed.csv"
        )

        return deaths, deaths_age, inc

