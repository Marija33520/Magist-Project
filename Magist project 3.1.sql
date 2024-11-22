-- LMS 3.1
-- 1. What categories of tech products does Magist have?
USE magist;

SELECT
product_category_name, product_id AS tech_products
FROM 
products;
-- e.g.
-- "audio", 
-- "electronics", 
-- "computers_accessories", 
-- "pc_gamer", 
-- "computers", 
-- "tablets_printing_image", 
-- "telephony";

-- 2.1 How many products of these tech categories have been sold (within the time window of the database snapshot)? 
-- number of tech products sold:
SELECT 
    COUNT(order_item_id)            
FROM order_items
    LEFT JOIN products
        USING (product_id)
    LEFT JOIN product_category_name_translation
		USING (product_category_name)
 WHERE product_category_name_english IN ('telephony' , 'fixed_telephony')
    ;
    -- solution is:  = 4809,,
    -- we can also do "OUNT(*)"or "OUNT(*) AS num_sold"instead COUNT(order_item_id)
    
 -- 2.2 What percentage does that represent from the overall number of products sold?
 -- number of all products sold:
SELECT
COUNT(*) as num_sold
FROM order_items;
-- 112650
-- %:
SELECT 100 * (4809/12659);
 -- solution is:  37.98
  
-- 3. What’s the average price of the products being sold?
SELECT 
    ROUND(AVG(price), 2) AS average_price
FROM 
    order_items
WHERE 
    product_id BETWEEN '2017-09-09' AND '2023-11-28';
    -- solution is: 99.94
    
    SELECT
    AVG(price)
    FROM
    order_items;
    -- solution is: 120.65
    
-- 4.Are expensive tech products popular? 
SELECT
    COUNT(*)
FROM order_items
  LEFT JOIN products
    USING (product_id)
 LEFT JOIN product_category_name_translation
   USING (product_category_name)
WHERE product_category_name_english IN ('telephony' , 'fixed_telephony')
AND order_items.price > 400;
-- solution is: 117

SELECT
COUNT(*) as num_sold
FROM order_items;
-- 112650

  SELECT 100 * (117/112650);
  -- solution is: 0.1039
    
 -- ==================================================================================================================================================================================================================================
SELECT*
FROM
customers;

SELECT*
FROM
geo;

SELECT*
FROM
order_items;

SELECT*
FROM
order_payments;

SELECT*
FROM
orders;

SELECT*
FROM
products;

SELECT*
FROM
sellers;



