


 ------- parquet farmat---

 create schema MANAGE_DB.FILE_FORMATS;
 
CREATE OR REPLACE FILE FORMAT MANAGE_DB.FILE_FORMATS.PARQUET_FORMAT
    TYPE = 'parquet';

CREATE OR REPLACE STAGE MANAGE_DB.EXTERNAL_STAGES.PARQUETSTAGE
    url = 's3://snowflakeparquetdemo'  
    FILE_FORMAT = MANAGE_DB.FILE_FORMATS.PARQUET_FORMAT; 

list @MANAGE_DB.EXTERNAL_STAGES.PARQUETSTAGE;

create or replace table MANAGE_DB.FILE_FORMATS.sales_items
(raw_data variant);

select * from MANAGE_DB.FILE_FORMATS.sales_items;

copy into MANAGE_DB.FILE_FORMATS.sales_items
from @MANAGE_DB.EXTERNAL_STAGES.PARQUETSTAGE
FILE_FORMAT = MANAGE_DB.FILE_FORMATS.PARQUET_FORMAT;


select raw_data: index_level :: int as index_level,
       raw_data :cat_id :: string as cat_id,
       raw_data: d :: int as d,
       raw_data: date:: int as date,
       raw_data:dept_id : string as dept_id,
       raw_data:id ::string as id,
       raw_data :item_id :: string as item_id,
       raw_data:state_id :: string as state
       from MANAGE_DB.FILE_FORMATS.sales_items;

select raw_data :cat_id :: string as cat_id,
       raw_data: d :: int as d,
       raw_data: date:: int as date,
       raw_data:id ::string as id,
       raw_data :item_id :: string as item_id,
       raw_data:state_id :: string as state
       from MANAGE_DB.FILE_FORMATS.sales_items; 

create or replace  table hr_sales as
(select raw_data :cat_id :: string as cat_id,
       raw_data: d :: int as d,
       raw_data: date:: int as date,
       raw_data:id ::string as id,
       raw_data :item_id :: string as item_id,
       raw_data:state_id :: string as state
       from MANAGE_DB.FILE_FORMATS.sales_items);

       select * from HR_SALES;



      

   