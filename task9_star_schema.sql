

-- 1. Dimension Tables

CREATE TABLE DimCustomer (
    CustomerID SERIAL PRIMARY KEY,
    CustomerName VARCHAR(100),
    Segment VARCHAR(50)
);

CREATE TABLE DimProduct (
    ProductID SERIAL PRIMARY KEY,
    ProductName VARCHAR(150),
    Category VARCHAR(50),
    SubCategory VARCHAR(50)
);

CREATE TABLE DimDate (
    DateID SERIAL PRIMARY KEY,
    OrderDate DATE,
    Year INT,
    Month INT,
    Day INT
);

CREATE TABLE DimRegion (
    RegionID SERIAL PRIMARY KEY,
    Region VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50)
);

-- 2. Fact Table

CREATE TABLE FactSales (
    SalesID SERIAL PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    DateID INT,
    RegionID INT,
    Sales DECIMAL(10,2),
    Quantity INT,
    Profit DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES DimCustomer(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES DimProduct(ProductID),
    FOREIGN KEY (DateID) REFERENCES DimDate(DateID),
    FOREIGN KEY (RegionID) REFERENCES DimRegion(RegionID)
);

-- 3. Indexes for Performance

CREATE INDEX idx_customer ON FactSales(CustomerID);
CREATE INDEX idx_product ON FactSales(ProductID);
CREATE INDEX idx_date ON FactSales(DateID);
CREATE INDEX idx_region ON FactSales(RegionID);

-- 4. Sample Analytics Queries

-- Total Sales by Region
SELECT r.Region, SUM(f.Sales) AS TotalSales
FROM FactSales f
JOIN DimRegion r ON f.RegionID = r.RegionID
GROUP BY r.Region;

-- Sales by Category
SELECT p.Category, SUM(f.Sales) AS CategorySales
FROM FactSales f
JOIN DimProduct p ON f.ProductID = p.ProductID
GROUP BY p.Category;

-- Yearly Sales
SELECT d.Year, SUM(f.Sales) AS YearlySales
FROM FactSales f
JOIN DimDate d ON f.DateID = d.DateID
GROUP BY d.Year;


