


CREATE OR REPLACE STAGE  MANAGE_DB.EXTERNAL_STAGES.json_STG 
  URL = 's3://varutalks/json/'
  STORAGE_INTEGRATION =  my_s3_int;

list @MANAGE_DB.EXTERNAL_STAGES.json_STG;

create or replace table MANAGE_DB.public.music_json
(raw_data  variant);


select * from MANAGE_DB.public.music_json;

CREATE OR REPLACE PIPE MANAGE_DB.public.music_pipe
AUTO_INGEST = true
AS
COPY INTO MANAGE_DB.public.music_json
FROM @MANAGE_DB.EXTERNAL_STAGES.json_STG
FILE_FORMAT = (TYPE = JSON);

describe pipe MANAGE_DB.public.music_pipe;

list @MANAGE_DB.EXTERNAL_STAGES.json_STG

 SELECT * FROM MANAGE_DB.public.MUSIC_JSON ;

alter pipe MANAGE_DB.public.music_pipe refresh;

 // Resume pipe
ALTER PIPE MANAGE_DB.public.MUSIC_PIPE SET PIPE_EXECUTION_PAUSED = false 

// Verify pipe is running again
SELECT SYSTEM$PIPE_STATUS('MANAGE_DB.public.MUSIC_PIPE') 
