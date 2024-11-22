# 3.2
-- 1.How many months of data are included in the magist database?

SELECT 
    TIMESTAMPDIFF(MONTH,
        MIN(order_purchase_timestamp),
        MAX(order_purchase_timestamp))
FROM
    orders;
	-- 25 months
    
 

-- 2.1
-- How many Tech sellers are there? 

SELECT
     COUNT(DISTINCT seller_id)
  FROM order_items
     LEFT JOIN products
       USING (product_id)
	 LEFT JOIN product_category_name_translation
       USING (product_category_name)
WHERE product_category_name_english IN ('telephony' , 'fixed_telephony');
-- solution is: = 176

-- 2.2
-- How many sellers are there?

SELECT
    COUNT(DISTINCT seller_id)
    FROM (order_items)
    ;
-- solution is: 3095

-- 2.3
-- What percentage of overall sellers are Tech sellers?  

SELECT 100 * (176/3095)
;
-- solution is:5,6866

-- 3.1 What is the total amount earned by all sellers? 
-- we use price from order_items and not payment_value from order_payments as an order may contain tech and non tech product. With payment_value we can't distinguish between items in an order
SELECT 
    SUM(oi.price) AS total
FROM
    order_items oi
        LEFT JOIN
    orders o USING (order_id)
WHERE
    o.order_status NOT IN ('unavailable' , 'canceled');
    -- solution is: 13494400.7418
    
   -- the average monthly income of all sellers?
SELECT 13494400.74/ 3095 / 25;
	-- 174.40 
    
-- 3.2 -- What is the total amount earned by all Tech sellers?
SELECT 
    SUM(oi.price) AS total
FROM
    order_items oi
        LEFT JOIN
    orders o USING (order_id)
        LEFT JOIN
    products p USING (product_id)
        LEFT JOIN
    product_category_name_translation pt USING (product_category_name)
WHERE
    o.order_status NOT IN ('unavailable' , 'canceled')
        AND pt.product_category_name_english IN ('audio' , 'electronics',
        'computers_accessories',
        'pc_gamer',
        'computers',
        'tablets_printing_image',
        'telephony');
	-- 1666211.28
    
-- the average monthly income of Tech sellers?
SELECT 1666211.28 / 454 / 25;
	-- 146.80

-- 4.1
-- Can you work out the average monthly income of all sellers?  
SELECT
  MAX(order_purchase_timestamp),                
  MIN(order_purchase_timestamp)
FROM orders;
-- 25.5 months
SELECT
  SUM(price)/COUNT(DISTINCT seller_id)
  FROM order_items;
  -- 4391.48
  SELECT 4391.48/25.5;
  -- 172.21


-- 4.2 Can you work out the average monthly income of Tech sellers?
-- the average monthly income of Tech sellers:
SELECT 1666211.28 / 454 / 25;
	-- 146.80


