
-- ===============================================
-- SQL Intermediate Project: Joins & Business Analysis
-- Dataset: Chinook Database
-- ===============================================

-- 1. INNER JOIN: Orders with Customer Information
SELECT 
    i.InvoiceId,
    i.InvoiceDate,
    c.CustomerId,
    c.FirstName,
    c.LastName,
    c.Country,
    i.Total
FROM Invoice i
INNER JOIN Customer c
ON i.CustomerId = c.CustomerId
ORDER BY i.InvoiceDate;


-- 2. Validate Order Count
SELECT COUNT(*) AS TotalInvoices FROM Invoice;

SELECT COUNT(*) AS JoinedInvoices
FROM Invoice i
INNER JOIN Customer c
ON i.CustomerId = c.CustomerId;


-- 3. LEFT JOIN: Customers with No Orders
SELECT 
    c.CustomerId,
    c.FirstName,
    c.LastName,
    c.Email
FROM Customer c
LEFT JOIN Invoice i
ON c.CustomerId = i.CustomerId
WHERE i.InvoiceId IS NULL;


-- 4. Revenue per Product
SELECT 
    t.Name AS ProductName,
    SUM(il.UnitPrice * il.Quantity) AS TotalRevenue
FROM InvoiceLine il
INNER JOIN Track t
ON il.TrackId = t.TrackId
GROUP BY t.Name
ORDER BY TotalRevenue DESC
LIMIT 10;


-- 5. Category-wise Revenue
SELECT 
    g.Name AS Category,
    SUM(il.UnitPrice * il.Quantity) AS CategoryRevenue
FROM InvoiceLine il
INNER JOIN Track t
ON il.TrackId = t.TrackId
INNER JOIN Genre g
ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY CategoryRevenue DESC;


-- 6. Sales in USA between 2010 and 2012
SELECT 
    c.Country,
    SUM(i.Total) AS TotalSales
FROM Invoice i
INNER JOIN Customer c
ON i.CustomerId = c.CustomerId
WHERE c.Country = 'USA'
AND i.InvoiceDate BETWEEN '2010-01-01' AND '2012-12-31'
GROUP BY c.Country;

-- ===============================================
-- End of SQL Project File
-- ===============================================
