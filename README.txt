ETL Mini Pipeline Project

Project Overview

This project demonstrates a simple ETL (Extract → Transform → Load)
pipeline using Python and pandas.

Dataset Used: Retail Sales Sample Dataset

------------------------------------------------------------------------

Step 1: Extract

-   Loaded raw CSV dataset into Google Colab using pandas.
-   Verified structure using df.info() and df.isnull().sum().

------------------------------------------------------------------------

Step 2: Transform

-   Removed duplicate records.
-   Standardized column names (lowercase, underscore format).
-   Converted data types (order_date to datetime, sales & profit to
    float).
-   Created a derived column: profit_margin = profit / sales.

------------------------------------------------------------------------

Step 3: Split Data

Created separate tables: - customers table - orders table - products
table

------------------------------------------------------------------------

Step 4: Load

-   Exported cleaned tables as CSV files:
    -   customers.csv
    -   orders.csv
    -   products.csv

------------------------------------------------------------------------

Step 5: Validation

-   Verified row counts before and after transformation.
-   Ensured no missing critical values.
-   Confirmed successful file export.

------------------------------------------------------------------------

Tools Used

-   Python (Google Colab)
-   pandas
-   CSV storage format

------------------------------------------------------------------------

Conclusion

This ETL pipeline demonstrates basic data engineering concepts including
data cleaning, transformation, data modeling, and loading structured
outputs for further analysis.
