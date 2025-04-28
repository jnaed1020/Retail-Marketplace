import sqlite3

# Connect to your database
conn = sqlite3.connect('Pinehurst_Marketplace.db')  # Adjust the path to your database
cursor = conn.cursor()

# List all tables in the database
cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
tables = cursor.fetchall()

for table in tables:
    print(table[0])  # Print each table name

conn.close()