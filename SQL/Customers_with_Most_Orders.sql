SELECT c.FirstName, c.LastName, COUNT(o.OrderID) AS OrdersCount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID
ORDER BY OrdersCount DESC;


