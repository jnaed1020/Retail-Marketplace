SELECT c.FirstName, c.LastName, o.OrderDate, od.ProductID, od.Quantity, od.PriceEach
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE c.CustomerID = 1;




