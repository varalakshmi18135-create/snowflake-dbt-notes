

---table---

CREATE OR REPLACE TABLE vitech_dev_db.PUBLIC.ORDERS_EX (
    ORDER_ID VARCHAR(30),
    AMOUNT INT,
    PROFIT INT,
    QUANTITY INT,
    CATEGORY VARCHAR(30),
    SUBCATEGORY VARCHAR(30));

    select * from vitech_dev_db.PUBLIC.ORDERS_EX;

---stages--
CREATE OR REPLACE STAGE vitech_dev_db.stages.aws_stage_errorex
    url='s3://bucketsnowflakes4' ;

 ---list---

 list @vitech_dev_db.stages.aws_stage_errorex

 ----copy---

 ----validation_mode ---

 copy into vitech_dev_db.PUBLIC.ORDERS_EX
 from @vitech_dev_db.stages.aws_stage_errorex
 file_format = (type=csv, skip_header =1)
 validation_mode= return_errors;

 ----on_error----

--it will skip only the error records--

copy into vitech_dev_db.PUBLIC.ORDERS_EX
 from @vitech_dev_db.stages.aws_stage_errorex
 file_format = (type=csv, skip_header =1)
 on_error = continue  --1783

 ----skip file----

copy into vitech_dev_db.PUBLIC.ORDERS_EX
 from @vitech_dev_db.stages.aws_stage_errorex
 file_format = (type=csv, skip_header =1)
 on_error = skip_file

    SELECT * FROM  vitech_dev_db.PUBLIC.ORDERS_EX; 

    ----force----

    COPY INTO   vitech_dev_db.PUBLIC.ORDERS_EX
  FROM @vitech_dev_db.stages.aws_stage_errorex
  FILE_FORMAT = (TYPE=CSV , SKIP_HEADER=1) 
  ON_ERROR = CONTINUE 
  FORCE= TRUE 

  CREATE OR REPLACE TABLE vitech_dev_db.PUBLIC.ORDERS_EX1 (
    ORDER_ID VARCHAR(30),
    AMOUNT INT,
    PROFIT INT,
    QUANTITY INT,
    CATEGORY VARCHAR(3),
    SUBCATEGORY VARCHAR(30));

     COPY INTO   vitech_dev_db.PUBLIC.ORDERS_EX1
    FROM @vitech_dev_db.stages.aws_stage_errorex
    FILE_FORMAT = (TYPE=CSV , SKIP_HEADER=1) 
    ON_ERROR = CONTINUE 
    TRUNCATECOLUMNS = TRUE 

SELECT * FROM  vitech_dev_db.PUBLIC.ORDERS_EX1; 

COPY INTO   vitech_dev_db.PUBLIC.ORDERS_EX
  FROM @vitech_dev_db.stages.aws_stage_errorex
  FILE_FORMAT = (TYPE=CSV , SKIP_HEADER=1) 
  ON_ERROR = CONTINUE  
  SIZE_LIMIT = 2000 ;

  SELECT * FROM  vitech_dev_db.PUBLIC.ORDERS_EX; 

   COPY INTO   vitech_dev_db.PUBLIC.ORDERS_EX
    FROM @vitech_dev_db.stages.aws_stage_errorex
    FILE_FORMAT = (TYPE=CSV , SKIP_HEADER=1) 
    ON_ERROR = CONTINUE 
    TRUNCATECOLUMNS = TRUE 


 

 
 


 
