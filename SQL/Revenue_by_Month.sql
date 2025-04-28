SELECT strftime('%Y-%m', OrderDate) AS Month, SUM(od.Quantity * od.PriceEach) AS MonthlyRevenue
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY Month
ORDER BY Month;


