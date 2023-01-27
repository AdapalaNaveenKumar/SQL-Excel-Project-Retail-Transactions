--- Title :-  Retail Transactions
--- Tool used:- Ms SQL SERVER

--Approach :- 
		--• Understanding the dataset
		--• Creating business questions
		--• Analysing through SQL queries

--SHOW THE ALL RETAIL TRANSACTIONS

SELECT * FROM ['Retail Transactions$'];

--total amount,avg amount, max amount, min amount

SELECT ROUND(SUM(ORDER_AMT),0) AS  TOTAL_AMOUNT,
       ROUND(AVG(ORDER_AMT),4) AS  AVG_AMOUNT,
       ROUND(MAX(ORDER_AMT),2) AS  MAX_AMOUNT,
       ROUND(MIN(ORDER_AMT),2) AS  MIN_AMOUNT 
FROM ['Retail Transactions$'];

--total items,avg items, max items, min items

SELECT ROUND(SUM(num_of_items),0) AS  TOTAL_ITEMS,
       ROUND(AVG(num_of_items),4) AS  AVG_ITEMS,
       ROUND(MAX(num_of_items),2) AS  MAX_ITEMS,
       ROUND(MIN(num_of_items),2) AS  MIN_ITEMS
FROM ['Retail Transactions$'];

--State wise total,avg,max,min amounts

SELECT LOCATION_STATE AS STATE,
       ROUND(SUM(order_amt),0) AS TOTAL_AMOUNT,
	   ROUND(AVG(order_amt),2) AS AVG_AMOUNT,
	   ROUND(MAX(order_amt),2) AS MAX_AMOUNT,
	   ROUND(MIN(order_amt),2) AS MIN_AMOUNT
FROM ['Retail Transactions$']
GROUP BY location_state
ORDER BY TOTAL_AMOUNT,AVG_AMOUNT,MAX_AMOUNT,MIN_AMOUNT ;


--city wise total,avg,max,min amounts

SELECT location_city AS city,
       ROUND(SUM(order_amt),0) AS TOTAL_AMOUNT,
	   ROUND(AVG(order_amt),2) AS AVG_AMOUNT,
	   ROUND(MAX(order_amt),2) AS MAX_AMOUNT,
	   ROUND(MIN(order_amt),2) AS MIN_AMOUNT
FROM ['Retail Transactions$']
GROUP BY location_city
ORDER BY TOTAL_AMOUNT,AVG_AMOUNT,MAX_AMOUNT,MIN_AMOUNT ;

--Top 10 cities by amounts

SELECT top (10) location_city AS city,
       ROUND(SUM(order_amt),0) AS TOTAL_AMOUNT,
	   ROUND(AVG(order_amt),2) AS AVG_AMOUNT,
	   ROUND(MAX(order_amt),2) AS MAX_AMOUNT,
	   ROUND(MIN(order_amt),2) AS MIN_AMOUNT
FROM ['Retail Transactions$']
GROUP BY location_city
ORDER BY TOTAL_AMOUNT,AVG_AMOUNT,MAX_AMOUNT,MIN_AMOUNT 


-- Get an output presenting Count of rewards which were genuine

SELECT COUNT(REWARDS_MEMBER) AS GENUINE
FROM ['Retail Transactions$']
WHERE rewards_member = 'TRUE';


 --Get an output presenting Count of rewards which were fake


SELECT COUNT(REWARDS_MEMBER) AS FAKE
FROM ['Retail Transactions$']
WHERE rewards_member = 'FALSE';

-- Calculate the Discount % given to Customers in each State.

SELECT LOCATION_STATE,
       ROUND(SUM(DISCOUNT_AMT) * 100 / SUM(ORDER_AMT),2) AS DISCOUNT_per
FROM ['Retail Transactions$']
GROUP BY LOCATION_STATE
ORDER BY DISCOUNT_PER DESC;

-- Calculate the Discount % given to Customers in each city.

SELECT LOCATION_CITY,
       ROUND(SUM(DISCOUNT_AMT) * 100 / SUM(ORDER_AMT),2) AS DISCOUNT_per
FROM ['Retail Transactions$']
GROUP BY LOCATION_CITY
ORDER BY DISCOUNT_PER DESC;


--State wise total,avg,max,min no of items

SELECT LOCATION_STATE AS STATE,
       ROUND(SUM(num_of_items),0) AS TOTAL_ITEMS,
	   ROUND(AVG(num_of_items),2) AS AVG_ITEMS,
	   ROUND(MAX(num_of_items),2) AS MAX_ITEMS,
	   ROUND(MIN(num_of_items),2) AS MIN_ITEMS
FROM ['Retail Transactions$']
GROUP BY location_state
ORDER BY TOTAL_ITEMS,AVG_ITEMS,MAX_ITEMS,MIN_ITEMS ;

--city wise total,avg,max,min no of items

SELECT LOCATION_CITY AS CITY,
       ROUND(SUM(num_of_items),0) AS TOTAL_ITEMS,
	   ROUND(AVG(num_of_items),2) AS AVG_ITEMS,
	   ROUND(MAX(num_of_items),2) AS MAX_ITEMS,
	   ROUND(MIN(num_of_items),2) AS MIN_ITEMS
FROM ['Retail Transactions$']
GROUP BY location_city
ORDER BY TOTAL_ITEMS,AVG_ITEMS,MAX_ITEMS,MIN_ITEMS ;

--TOP 10 CITIES BY ITEMS

SELECT top (10) location_city AS city,
       ROUND(SUM(num_of_items),0) AS TOTAL_Items,
	   ROUND(AVG(num_of_items),2) AS AVG_items,
	   ROUND(MAX(num_of_items),2) AS MAX_items,
	   ROUND(MIN(num_of_items),2) AS MIN_items
FROM ['Retail Transactions$']
GROUP BY location_city 
ORDER BY TOTAL_Items DESC,AVG_items ,MAX_items ,MIN_items 


--total amount by monthly

SELECT DATENAME(MONTH FROM TRANSACTION_DATE) AS MONTH,
       ROUND(SUM(ORDER_AMT),0) AS TOTAL_AMOUNT
FROM ['Retail Transactions$']
GROUP BY DATENAME(MONTH FROM TRANSACTION_DATE)
ORDER BY TOTAL_AMOUNT DESC;

--total amount by yearly

SELECT DATEPART(YEAR FROM TRANSACTION_DATE) AS YEAR,
       ROUND(SUM(ORDER_AMT),0) AS TOTAL_AMOUNT
FROM ['Retail Transactions$']
GROUP BY DATEPART(YEAR FROM TRANSACTION_DATE)
ORDER BY TOTAL_AMOUNT DESC;

--total items by monthly

SELECT DATENAME(MONTH FROM TRANSACTION_DATE) AS MONTH,
       ROUND(SUM(num_of_items),0) AS TOTAL_ITEMS
FROM ['Retail Transactions$']
GROUP BY DATENAME(MONTH FROM TRANSACTION_DATE)
ORDER BY TOTAL_ITEMS DESC;

--total items by Yearly

SELECT DATEPART(YEAR FROM TRANSACTION_DATE) AS YEAR,
       ROUND(SUM(num_of_items),0) AS TOTAL_ITEMS
FROM ['Retail Transactions$']
GROUP BY DATEPART(YEAR FROM TRANSACTION_DATE)
ORDER BY TOTAL_ITEMS DESC;


