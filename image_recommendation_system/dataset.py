from pathlib import Path

from kaggle.api.kaggle_api_extended import KaggleApi
from loguru import logger
from rich import print
from tqdm import tqdm
import typer

from image_recommendation_system.config import (
    KAGGLE_DATASET_URL,
    PROCESSED_DATA_DIR,
    RAW_DATA_DIR,
)

app = typer.Typer()


@app.command()
def main(
    # ---- REPLACE DEFAULT PATHS AS APPROPRIATE ----
    input_path: Path = RAW_DATA_DIR / "dataset.csv",
    output_path: Path = PROCESSED_DATA_DIR / "dataset.csv",
    # ----------------------------------------------
):
    # ---- REPLACE THIS WITH YOUR OWN CODE ----
    logger.info("Processing dataset...")
    for i in tqdm(range(10), total=10):
        if i == 5:
            logger.info("Something happened for iteration 5.")
    logger.success("Processing dataset complete.")
    # -----------------------------------------


@app.command("download")
def download_dataset_from_kaggle(url=KAGGLE_DATASET_URL, custom_dir=RAW_DATA_DIR):
    """download all files and folders for a dataset, natively the kaggle api can resume the download if interuption occurs.
    It download and places all the files and folder from given kaggle dataset into given custom_dir directory"""

    try:
        api = KaggleApi()
        api.authenticate()

        api.dataset_download_files(dataset=url, path=custom_dir, quiet=False, unzip=True)

        print(f"Dataset downloaded to {custom_dir}")

    except Exception as e:
        print(f"An error occurred: {e}")
        raise


if __name__ == "__main__":
    app()
