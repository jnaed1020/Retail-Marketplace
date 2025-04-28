-- Drop tables if they already exist
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS OrderDetails;

-- Create Tables
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(2),
    ZipCode VARCHAR(10),
    RegistrationDate DATE
);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    CategoryID INT,
    Price DECIMAL(10,2),
    Stock INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    ShippingAddress VARCHAR(150),
    Status VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PriceEach DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert Data into Customers
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address, City, State, ZipCode, RegistrationDate) VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '555-1234', '123 Main St', 'Pinehurst', 'NC', '28374', '2023-06-15'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '555-5678', '456 Oak St', 'Pinehurst', 'NC', '28374', '2023-07-22'),
(3, 'Emily', 'Johnson', 'emily.johnson@email.com', '555-9012', '789 Maple Ave', 'Pinehurst', 'NC', '28374', '2024-01-10');

-- Insert Data into Categories
INSERT INTO Categories (CategoryID, CategoryName) VALUES
(1, 'Electronics'),
(2, 'Home Goods'),
(3, 'Clothing');

-- Insert Data into Products
INSERT INTO Products (ProductID, ProductName, CategoryID, Price, Stock) VALUES
(1, 'Wireless Headphones', 1, 79.99, 50),
(2, 'Smart Thermostat', 1, 149.99, 30),
(3, 'Ceramic Vase', 2, 39.99, 100),
(4, 'Winter Jacket', 3, 129.99, 20);

-- Insert Data into Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, ShippingAddress, Status) VALUES
(1, 1, '2024-04-15', '123 Main St, Pinehurst, NC, 28374', 'Shipped'),
(2, 2, '2024-04-16', '456 Oak St, Pinehurst, NC, 28374', 'Pending');

-- Insert Data into OrderDetails
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, PriceEach) VALUES
(1, 1, 1, 1, 79.99),
(2, 1, 3, 2, 39.99),
(3, 2, 4, 1, 129.99);
