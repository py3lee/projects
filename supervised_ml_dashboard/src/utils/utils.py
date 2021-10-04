from datetime import datetime
import logging

def create_logger(log_path):
    """
    Creates logger

    Returns:
        logger
    """
    NOW = datetime.now()
    RUN_DATE = NOW.strftime('%Y%m%d')

    h1 = logging.StreamHandler()
    h1.setLevel(logging.DEBUG)

    h2 = logging.FileHandler(filename=f'{log_path}/vaers_{RUN_DATE}.log')
    h2.setLevel(logging.INFO)

    logging.basicConfig(level=logging.DEBUG, 
                        format='%(asctime)s : %(levelname)s : %(filename)s, line %(lineno)s : %(message)s',
                        handlers=[h1, h2]
                        )
    logger = logging.getLogger(__name__)
    return logger
