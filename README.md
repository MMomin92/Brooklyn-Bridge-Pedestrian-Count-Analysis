# CIS9440-HW

## Summary
This project aims to extract data from the Brooklyn Bridge Automated Pedestrian Counts Demonstration Project provided by NYC OpenData and store it into an AWS S3 bucket using Python. The dataset contains information about pedestrian counts, weather conditions, and other relevant details.

## Process Overview

1. Data Extraction: The data is extracted from the OpenData NYC API using Python's requests library. Due to the API's default limit of 1000 rows, the extraction process iterates over multiple requests, incrementing the offset parameter to retrieve the entire dataset.

2. AWS S3 Storage: The extracted data is stored in an AWS S3 bucket. The boto3 library is used to interact with the AWS S3 service. Before running the code, ensure that the AWS access key and secret access key are set as environment variables. This is crucial for maintaining security as these credentials should not be hardcoded in the codebase.