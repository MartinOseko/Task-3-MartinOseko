--To show the dataset columns and rows
SELECT*
FROM dbo.dataset

--Show Orders where product is laptop
--replace laptop with any product (monitor,phone,chair,printer...)
SELECT*
FROM dbo.dataset
WHERE Product ='Laptop'

--Show allcancelled orders with total price above 100
SELECT*
FROM dbo.dataset
WHERE OrderStatus = 'Cancelled'AND TotalPrice > 1000

--List all distinct payment method
SELECT DISTINCT PaymentMethod
FROM dbo.dataset

--Find all the orders that used the coupon WINTER15
--Replace CouponCode with(SAVE10,FREESHIP or NoCoupon) 
SELECT*
FROM dbo.dataset
WHERE CouponCode = 'WINTER15'

--ORDER BY
--Show the 10 highest value orders
SELECT TOP 20*
FROM dbo.dataset
ORDER BY TotalPrice
DESC 
--Show all orders sorted by date,oldest first
SELECT TOP 20*
FROM dbo.dataset
ORDER BY Date ASC

--GROUP BY

--count how many orders exist for each product
SELECT Product,COUNT(*) AS order_count
FROM dbo.dataset
GROUP BY Product
--find total revenue
 

--find the average order by value
SELECT ReferralSource, AVG(TotalPrice) AS avg_order_value
FROM dbo.dataset 
GROUP BY ReferralSource

--find the total quantity sold per product
SELECT Product, SUM(Quantity) AS units_sold
FROM dbo.dataset
GROUP BY Product

--HAVING (FILTERING)
--REFERRALsources more than 100 orders
SELECT ReferralSource,COUNT(*) AS orders
FROM dbo.dataset
GROUP BY ReferralSource
HAVING COUNT(*)>100

--product have an average unit price above 300
SELECT Product,AVG(UnitPrice) AS avg_price
FROM dbo.dataset
GROUP BY Product
HAVING AVG(UnitPrice) >300

--Combining multiple scripts

--excluding cancelled orders find the average order value per payment method
--but only show methods averaging more than 800
SELECT PaymentMethod, AVG(TotalPrice) AS avg_spent
FROM dbo.dataset
WHERE OrderStatus != 'Cancelled'
GROUP BY PaymentMethod
HAVING AVG(TotalPrice) >800
ORDER BY avg_spent DESC

--for each product show the total revenue
SELECT Product,SUM(TotalPrice) AS revenue,COUNT(*) AS order_count
FROM dbo.dataset
GROUP BY Product
HAVING COUNT(*)>100
ORDER BY revenue DESC

--Find which order status has the highest revenue
SELECT OrderStatus, AVG(ItemsInCart) AS avg_cart_size
FROM dbo.dataset
GROUP BY OrderStatus
ORDER BY avg_cart_size DESC
















