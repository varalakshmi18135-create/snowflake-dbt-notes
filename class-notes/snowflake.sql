

-----SNOWFLAKE------

CREATE DATABASE  VITECH_DEV_DB;

CREATE TABLE VITECH_DEV_DB.PUBLIC.LOAN_PAYMENT_V1 (
  Loan_ID STRING,
  loan_status STRING,
  Principal STRING,
  terms STRING,
  effective_date STRING,
  due_date STRING,
  paid_off_time STRING,
  past_due_days STRING,
  age STRING,
  education STRING,
  Gender STRING);	

  SELECT * FROM VITECH_DEV_DB.PUBLIC.LOAN_PAYMENT ;

  COPY INTO VITECH_DEV_DB.PUBLIC.LOAN_PAYMENT
  FROM 's3://bucketsnowflakes3/Loan_payments_data.csv'
  FILE_FORMAT = (TYPE=CSV, skip_header=1);

--- --transformation---

SELECT LOAN_ID ,TERMS , (TERMS * 5)/10  AS INTR  FROM VITECH_DEV_DB.PUBLIC.LOAN_PAYMENT;

select LOAN_ID, gender from VITECH_DEV_DB.PUBLIC.LOAN_PAYMENT
                where gender = 'male';

male ; 423

select LOAN_ID, gender from VITECH_DEV_DB.PUBLIC.LOAN_PAYMENT
                where gender = 'female';

female : 77

---- stages----

create schema VITECH_DEV_DB.stages;

----internal stage---

create or replace stage VITECH_DEV_DB.stages.int_stage;

---list of stage---

list@VITECH_DEV_DB.stages.int_stage;

SELECT * FROM VITECH_DEV_DB.PUBLIC.LOAN_PAYMENT;

COPY INTO  VITECH_DEV_DB.PUBLIC.LOAN_PAYMENT
FROM @VITECH_DEV_DB.stages.int_stage
FILE_FORMAT= (TYPE =CSV, SKIP_HEADER =1);


------EXTERNAL STAGE----

CREATE OR REPLACE STAGE VITECH_DEV_DB.STAGES.AWS_EXT_STAGE 

 url= 's3://bucketsnowflakes3/';

 LIST @VITECH_DEV_DB.STAGES.AWS_EXT_STAGE;

 COPY INTO VITECH_DEV_DB.PUBLIC.LOAN_PAYMENT_V1
 FROM @VITECH_DEV_DB.STAGES.AWS_EXT_STAGE
 FILE_FORMAT= (TYPE =CSV, SKIP_HEADER =1)
 FILES = ('Loan_payments_data.csv')

SELECT * FROM VITECH_DEV_DB.PUBLIC.LOAN_PAYMENT_V1
