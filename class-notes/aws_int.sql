

create or replace database manage_db;

create or replace schema manage_db.external_stages;

create or replace stage manage_db.external_stages.netflix_stg
url= 's3://varutalks/csv/';

list @manage_db.external_stages.netflix_stg

CREATE OR REPLACE STORAGE INTEGRATION my_s3_int
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = 'S3'
  ENABLED = TRUE
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::798667482040:role/snowdbt'
  STORAGE_ALLOWED_LOCATIONS = ('s3://varutalks/csv/','s3://varutalks/json/');

  desc integration my_s3_int;

  CREATE OR REPLACE STAGE manage_db.external_stages.netflix_stg
  URL = 's3://varutalks/csv/'
  STORAGE_INTEGRATION = my_s3_int;

  list @manage_db.external_stages.netflix_stg;

  CREATE OR REPLACE TABLE MANAGE_DB.public.netflix_titles (
  show_id STRING,
  type STRING,
  title STRING,
  director STRING,
  cast STRING,
  country STRING,
  date_added STRING,
  release_year STRING,
  rating STRING,
  duration STRING,
  listed_in STRING,
  description STRING 
);

select * from MANAGE_DB.public.netflix_titles;

create schema MANAGE_DB.file_formats;

   CREATE OR REPLACE FILE FORMAT MANAGE_DB.file_formats.netflix_csv_format
  TYPE = 'CSV'
  FIELD_DELIMITER = ','
  SKIP_HEADER = 1
  FIELD_OPTIONALLY_ENCLOSED_BY = '"' -- This stops commas inside descriptions from breaking columns
  ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE; -- Bypasses the error if the file still has extra structural columns



COPY INTO MANAGE_DB.public.netflix_titles
  FROM @manage_db.external_stages.netflix_stg
  file_format =MANAGE_DB.file_formats.netflix_csv_format 
  on_error = continue;

 
select * from MANAGE_DB.public.netflix_titles;

------json----

CREATE OR REPLACE STAGE  MANAGE_DB.EXTERNAL_STAGES.json_STG 
  URL = 's3://varutalks/json/'
  STORAGE_INTEGRATION =  my_s3_int;

list @MANAGE_DB.EXTERNAL_STAGES.json_STG ;

CREATE OR REPLACE TABLE MANAGE_DB.public.MUSIC_JSON 
  (RAW_DATA    VARIANT );

  COPY INTO MANAGE_DB.public.MUSIC_JSON 
 FROM @MANAGE_DB.EXTERNAL_STAGES.json_STG 
 FILE_FORMAT = (TYPE=JSON) ;

 select * from MANAGE_DB.public.MUSIC_JSON;



