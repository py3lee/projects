from pathlib import Path
import sys

##########
# Custom
##########
from lib.utils import create_logger
from lib.malaria_custom_preprocessor import CustomPreprocessor

################
# CONFIGURATIONS
################
cfg_path = Path(__file__).parents[2] / 'config'
sys.path.insert(0, str(cfg_path))

import config as cfg

def main(cfg):

    preprocess = CustomPreprocessor(cfg)
    deaths, deaths_age, inc = preprocess.run()

if __name__ == '__main__':
    log_path = Path(__file__).parents[2] / 'logs'
    logger = create_logger(log_path)

    main(cfg)