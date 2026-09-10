


tASK :
 
 
  MID    MONTH_NAME AMOUNT
  ------------------------
  1     JAN         20000
  2      FEB         30000
  3      MAR        10000
  ..
  ...
  ...
  12    DEC         45000
 
 
  I WNAT TO SEE PROFIT OR LOSS  (lEAD /LAG)
 
    MID    MONTH_NAME AMOUNT      PROFIT_LOSS
  -----------------------------------------
  1     JAN         20000          nA
  2      FEB        30000        10000
  3      MAR        10000        -20000
  ..
  ...
  ...
  12    DEC         45000


  ---------------------

     select * from month

    ALTER TABLE month 
ADD COLUMN profit_loss VARCHAR(20);

ALTER TABLE month 
ADD COLUMN status VARCHAR(20);


UPDATE month
SET profit_loss = subquery.calc_profit_loss
FROM (
    SELECT 
        mid,
        amount
) AS subquery
WHERE month.mid = subquery.mid;

UPDATE month
SET status = subquery.calc_status
FROM (
    SELECT 
        mid,
        CASE 
            WHEN amount - LAG(amount) OVER (ORDER BY mid) > 0 THEN 'Profit'
            WHEN amount - LAG(amount) OVER (ORDER BY mid) < 0 THEN 'Loss'
            WHEN amount - LAG(amount) OVER (ORDER BY mid) = 0 THEN 'No Change'
            ELSE 'N/A'
        END AS calc_status
    FROM month
) AS subquery
WHERE month.mid = subquery.mid;