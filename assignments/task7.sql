

--find male and female count ??


select LOAN_ID, gender from VITECH_DEV_DB.PUBLIC.LOAN_PAYMENT
                where gender = 'male';

male ; 423

select LOAN_ID, gender from VITECH_DEV_DB.PUBLIC.LOAN_PAYMENT
                where gender = 'female';

female : 77



CREATE OR REPLACE TABLE VITECH_DEV_DB.PUBLIC.ORDERS (
    ORDER_ID VARCHAR(30),
    AMOUNT INT,
    PROFIT INT,
    QUANTITY INT,
    CATEGORY VARCHAR(30),
    SUBCATEGORY VARCHAR(30));

    LIST @VITECH_DEV_DB.STAGES.AWS_EXT_STAGE;

    COPY INTO VITECH_DEV_DB.PUBLIC.ORDERS
    FROM @VITECH_DEV_DB.STAGES.AWS_EXT_STAGE
    FILE_FORMAT = (TYPE = 'CSV',SKIP_HEADER = 1)
    FILES= ('OrderDetails.csv');

    select * from VITECH_DEV_DB.PUBLIC.ORDERS;

    count : 1500 rows