-- Load data from S3 into Redshift tables

-- Set the role to allow Redshift to access the S3 bucket
COPY bbp.dim_time FROM 's3://cis9440-hw-raw-data/dim_time.csv'
IAM_ROLE 'arn:aws:iam::788566477685:role/redshift-role'
IGNOREHEADER 1
CSV;

COPY bbp.dim_weather FROM 's3://cis9440-hw-raw-data/dim_weather.csv'
IAM_ROLE 'arn:aws:iam::788566477685:role/redshift-role'
IGNOREHEADER 1
CSV;

COPY bbp.dim_event FROM 's3://cis9440-hw-raw-data/dim_event.csv'
IAM_ROLE 'arn:aws:iam::788566477685:role/redshift-role'
IGNOREHEADER 1
CSV;

COPY bbp.fact_pedestrian FROM 's3://cis9440-hw-raw-data/fact_pedestrian.csv'
IAM_ROLE 'arn:aws:iam::788566477685:role/redshift-role'
IGNOREHEADER 1
CSV;
