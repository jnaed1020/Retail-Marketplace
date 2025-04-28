import sqlite3
import pandas as pd
import os

# Define the correct database path
db_path = r'C:\Users\jnaed\PycharmProjects\Retail\Retail Marketplace Projects\SQL\Market_Data'
print("Database Path:", db_path)

# Connect to the database
try:
    with sqlite3.connect(db_path) as conn:
        print("Successfully connected to database!")

        # List all tables in the database
        query_tables = "SELECT name FROM sqlite_master WHERE type='table';"
        tables = pd.read_sql_query(query_tables, conn)
        table_names = tables['name'].tolist()

        print("Tables inside database:", table_names)

        # Only try running query if OrderDetails table exists
        if 'OrderDetails' in table_names:
            query = """
            SELECT 
                p.ProductName,
                SUM(od.Quantity) AS TotalSold
            FROM OrderDetails od
            JOIN Products p ON od.ProductID = p.ProductID
            GROUP BY p.ProductName
            ORDER BY TotalSold DESC;
            """

            df = pd.read_sql_query(query, conn)
            print("\nQuery Results:")
            print(df)
        else:
            print("\nERROR: 'OrderDetails' table not found in database.")

except sqlite3.Error as e:
    print(f"\nDatabase error: {e}")
except Exception as e:
    print(f"\nGeneral error: {e}")




