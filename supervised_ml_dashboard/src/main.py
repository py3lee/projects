##########
# Built-in
##########
from pathlib import Path
import sys

###########
# Custom
##########
from preprocess.custom_ingestor import CustomIngestor
from preprocess.custom_preprocessor import CustomPreprocessor
from utils.utils import create_logger

################
# CONFIGURATIONS
################

cfg_path = Path(__file__).parents[1] / 'config'
sys.path.insert(0, str(cfg_path))

import config as cfg

def main():
    """PIpeline to:
    - ingest the 3 raw VAERS csv files, 
    - merge them into 1 main DataFrame,
    - clean the dataset, 
    - engineer required features,
    - create the composite target variable,
    - and all other custom preprocessing steps required to generate clean DataFrame for modelling phase. 
    """

    ingestor = CustomIngestor(cfg)
    df = ingestor.run()

    preprocess = CustomPreprocessor(df, cfg)
    df_visualize, df_model = preprocess.run()

if __name__ == '__main__':
    log_path = Path(__file__).parents[1] / 'logs'
    logger = create_logger(log_path)

    main()