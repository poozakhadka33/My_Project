# Sales Data Mart Development — AdventureWorks2014

## Project Overview

This academic project involved developing a Sales Data Mart from the existing AdventureWorks2014 database. The objective was to build a data warehousing workflow that transforms source data into a structured analytical model and makes sales information available for reporting and business intelligence.

The project covered database development, ETL (Extract, Transform, Load), dimensional modelling, SQL Server Analysis Services (SSAS), and interactive Power BI reporting.

## Project Objectives

- Build staging and data warehouse database structures.
- Load data from AdventureWorks2014 into a staging database.
- Transfer data from staging into warehouse dimension and fact tables.
- Maintain changing employee attributes using a Slowly Changing Dimension approach.
- Create a tabular analytical model using SQL Server Analysis Services.
- Develop Power BI reports to analyze sales across different dimensions and time periods.

## Tools and Technologies

- **Microsoft SQL Server Management Studio (SSMS):** Database setup, SQL scripts, and data verification.
- **SQL Server Integration Services (SSIS):** ETL data flows between the source, staging, and data warehouse.
- **Visual Studio:** SSIS package development and SSAS tabular project setup.
- **SQL Server Analysis Services (SSAS):** Tabular analytical model.
- **Power BI:** Interactive sales reporting and visualization.

## Project Workflow

### 1. Database Setup

Restored the AdventureWorks2014 source database and created the staging and data warehouse database structures using SQL scripts.

### 2. ETL: Source to Staging

Developed SSIS data flows to transfer data from AdventureWorks2014 into the staging database. Verified data population through SQL Server Management Studio.

### 3. ETL: Staging to Data Warehouse

Populated dimension and fact tables from the staging database. The sales data mart included Internet Sales and Reseller Sales fact tables connected to relevant dimensions.

Applied a Slowly Changing Dimension approach to handle changing employee attributes and preserve historical information.

### 4. SSAS Tabular Model

Set up a SQL Server Analysis Services tabular project and connected it to the data warehouse for analytical reporting.

### 5. Power BI Reporting

Connected Power BI to the SSAS tabular model and created interactive sales reports. The analysis included total sales and average sales across monthly, quarterly, weekly, and daily periods.

## Skills Demonstrated

- Data warehousing and sales data mart development
- ETL workflow design
- SQL Server database management
- Dimensional modelling using fact and dimension tables
- Slowly Changing Dimensions
- SSIS data flow development
- SSAS tabular modelling
- Power BI reporting and data visualization
- Data validation and analytical reporting

## Project Context

**Course:** Data Warehousing  
**Institution:** Dalarna University, Sweden  
**Project Type:** Group academic project  
**Year:** 2025

## Key Learning Outcome

This project provided practical experience with the end-to-end development of a data warehousing solution, from loading source data and building warehouse tables to creating an analytical model and interactive Power BI reports.

## Repository Note

The original implementation files are not currently included in this portfolio entry. This README documents the project workflow and technologies based on the submitted project report.
