-- find all products
SELECT * FROM products;

-- find all products that cost $1400
SELECT * FROM products 
WHERE price = 1400;

-- find all products that cost $11.99 or $13.99
SELECT * FROM products 
WHERE price = 11.99 OR price = 13.99; 

-- find all products that do NOT cost 11.99 - using NOT
SELECT * FROM products 
WHERE NOT price = 11.99; 

-- find all products and sort them by price from greatest to least
SELECT * FROM products 
ORDER BY price desc;

-- find all employees who don't have a middle initial
select * from employees
where MiddleInitial is null;

-- find distinct product prices
select DISTINCT(price) from products;

-- find all employees whose first name starts with the letter ‘j’
select * from employees
where FirstName like 'j%';

-- find all Macbooks
select * from products
where Name = "Macbook";

-- find all products that are on sale
select * from products
where OnSale = 1;

-- find the average price of all products
select AVG(Price) from Products;

-- find all Geek Squad employees who don't have a middle initial
select * from employees
where Title = "Geek Squad"
and MiddleInitial is null;

-- find all products from the products table whose stock level is in the range -- of 500 to 1200. Order by Price from least to greatest. Hint: Use the between keyword
select * from products 
where price between 500 and 1200
ORDER BY price asc;