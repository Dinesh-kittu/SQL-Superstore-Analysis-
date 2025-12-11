# SQL-Superstore-Analysis-

1. Project overview

This project analyzes a small Superstore-style dataset using only SQL. It answers business questions such as total revenue, top customers, best-selling products, monthly sales trends, and average order value. The goal is to be simple, reproducible, and ready to show on GitHub.

2. What’s included (files)

customers.csv — customer information

products.csv — product catalog and prices

orders.csv — order transactions (order id, date, customer, product, quantity)

project.sql — the SQL queries used for the analysis

README.md — this file

3. Prerequisites (what you need)

MySQL Server (or MariaDB) installed on your computer.

A MySQL client or GUI (MySQL Workbench, DBeaver, or the command-line client).

Basic terminal/command-line knowledge.

A GitHub account (to upload the project).

4. High-level steps (what you will do)

Create a new database for the project.

Create three tables: customers, products, and orders.

Import the three CSV files into those tables.

Run the SQL script project.sql to produce the analysis.

Commit and push the files to a GitHub repository.

5. Step-by-step instructions (worded guide)
Step 1 — Create the database

Open your MySQL client and create a database named project (or another name you prefer). This will be the container for your tables and data.

Step 2 — Create the tables

Inside the project database create three tables that match your CSV columns:

customers for customer details (id, name, city/state/country, email).

products for product data (id, name, category, price).

orders for order transactions (order id, order date, customer id, product id, quantity).

Make sure primary keys and foreign keys are set so orders.customer_id points to customers.customer_id and orders.product_id points to products.product_id. If orders have multiple items per order, use a compound key or add an order_item_id.

Step 3 — Import the CSV files

Use your MySQL client’s CSV import tool or the LOAD DATA LOCAL INFILE method to import:

customers.csv into customers

products.csv into products

orders.csv into orders
When importing, skip the header row and ensure date formats (e.g., YYYY-MM-DD) and numeric formats (price, quantity) are correct.

Step 4 — Validate the data

Run a few quick checks:

Count rows in each table to ensure numbers look right.

Check for NULLs in critical columns (id, price, quantity).

Inspect a few sample rows from each table to confirm column mapping.

Step 5 — Run the analysis queries

Open project.sql and execute the queries inside it. The script should include queries to:

Calculate total revenue (sum of quantity × price).

Find the customer who spent the most.

List top-selling products by quantity and revenue.

Compute average order value (total revenue ÷ number of unique orders).

Show monthly revenue trend.

Save or export the query results if you want to include screenshots or CSVs in your repo.

Step 6 — Summarize results (optional)

Write a short summary of your findings — 3–6 bullet points that mention the most important insights (example: top customer, best product, highest revenue month, average order value). Save this as RESULTS.md or include it in the README.

Step 7 — Prepare your GitHub repo

Create a new repository on GitHub (give it a meaningful name like sql-superstore-analysis).

Locally, in the project folder, initialize git, add files, commit, and push to GitHub.

Add a short repository description and a few relevant topics/tags (e.g., sql, mysql, data-analysis, beginner-project).

6. Good-to-have extras (recommended but optional)

A schema.sql file with CREATE TABLE statements so others can recreate the tables easily.

A small NOTES.md describing any cleaning steps or assumptions (for example: “prices are in USD”, “order_date format is YYYY-MM-DD”).

Exported query results or a short report.md summarizing insights.

A LICENSE file (MIT is common for student projects).

A README badge or small project banner for visual polish.

7. Short checklist before publishing to GitHub

 No sensitive personal data in CSVs (if there is, remove or anonymize it).

 project.sql runs without errors on the provided schema.

 schema.sql or table DDL included (recommended).

 Short result summary included (optional but helpful).

 .gitignore added to ignore local config files and credentials.

8. Contact / Author

Author: Dinesh M
You can add your email or GitHub profile link here.

9. Final notes (one-sentence)

This project is a clean, beginner-friendly SQL analysis you can run locally and publish to GitHub to showcase basic data-analysis skills using SQL.
