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


/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT P.Name AS Product, C.Name AS Category FROM products AS P
 INNER JOIN categories AS C ON C.CategoryID = P.CategoryID
 WHERE C.Name = "Computers";
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT P.Name, P.Price, r.Rating FROM products AS P
INNER JOIN reviews AS R ON r.ProductID = P.ProductID
WHERE r.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, Sum(s.Quantity) AS Total
FROM sales AS s
INNER JOIN employees AS e ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY Total DESC
;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name as 'Department Name', c.Name as 'Category Name' FROM departments AS d
INNER JOIN categories as c ON c.DepartmentID = d.DepartmentID
WHERE c.Name = 'Appliaces' OR c.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.Name, Sum(s.Quantity) AS "Total Sold", Sum(s.Quantity * s.PricePerUnit) AS "Total Prive"
FROM products AS p
INNER JOIN sales AS s ON s.ProductID = p.ProductID
WHERE p.ProductID = 97;
-- Verify
SELECT * FROM sales WHERE productID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name, r.Reviewer, r.Rating, r.Comment
FROM products AS p
INNER JOIN reviews AS r ON r.ProductID = p.ProductID
WHERE p.ProductID = 857 AND r.Rating = 1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, SUM(s.Quantity) AS TotalSold
FROM Sales AS s
INNER JOIN employees AS e ON e.EmployeeID = s.EmployeeID
INNER JOIN products AS p ON p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID
ORDER BY TotalSold DESC;
