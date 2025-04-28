SELECT c.CategoryName, SUM(od.Quantity * od.PriceEach) AS SalesByCategory
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName;




