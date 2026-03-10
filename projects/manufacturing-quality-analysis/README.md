## Manufacturing Quality Analysis Project

#Project Overview

This project analyzes manufacturing production data to understand production performance, defect rates, and machine downtime.
The dataset simulates a manufacturing environment with production, defect, machine, and downtime records over a six-month period.
The goal of this project is to demonstrate SQL skills for data analysis, including joins, aggregation, CTEs, and KPI calculations.

#Dataset
The dataset consists of four tables:

#Table	Description
production	Production records including machine, product, and quantity
defect	Defect information for each production batch
machine	Machine details and production lines
downtime	Machine downtime records
Database Schema


##Analysis Performed
# 1 Production Trend

Analyzed total production output per day.

Goal:
Identify production fluctuations and operational patterns.

# 2 Machine Performance

Calculated total production output per machine.

Goal:
Identify the most productive machines.

# 3 Defect Rate Analysis

Calculated defect percentage using:
Defect Rate = Total Defect / Total Production
This helps identify products with quality issues.

# 4 Yield Analysis

Calculated manufacturing yield using:
Yield = (Total Production − Total Defect) / Total Production
This metric evaluates production efficiency.

# 5 Downtime Analysis
Analyzed machine downtime duration to understand operational disruptions.

# Tools Used
PostgreSQL
SQL
DBeaver


# Key Insights
Example insights from the analysis:
Machine M13 produced the highest output.
Product P03 showed the highest defect rate.
Machine M09 experienced the highest downtime.

Next Steps
The next step is to build an interactive dashboard to visualize these insights using either:
Power BI
Tableau

Repository Structure
manufacturing-quality-analysis
│
├── data
│   production.csv
│   defect.csv
│   machine.csv
│   downtime.csv
│
├── sql
│   manufacturing_quality_analysis.sql
│
└── README.md
Author

Fara — Data Analytics Learning Journey
