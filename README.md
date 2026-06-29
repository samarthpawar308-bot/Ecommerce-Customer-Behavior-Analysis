# Ecommerce Customer Behavior Analysis

## Introduction
ShopEasy is a fictional online retail company operating across multiple product categories. ShopEasy's leadership identified a gap between marketing investment and actual purchase conversion. Despite strong top-funnel engagement, revenue growth was not keeping pace with traffic. 
This analysis was commissioned to diagnose where customers were dropping off, why sentiment was declining, and which products were silently underperforming — before these issues became visible in the P&L.

## Problem Statement

Despite strong website traffic and customer engagement, sales growth is not meeting expectations. The objective of this project is to identify:

* Conversion bottlenecks in the customer journey
* Factors driving customer sentiment
* Product performance issues
* Opportunities to improve customer experience and revenue

## Dataset Overview

The analysis is based on three datasets:

1. Customer Journey Data – tracks customer interactions from product view to purchase.
2. Customer Review Data – contains customer ratings and review text.
3. Marketing Engagement Data – contains campaign performance metrics such as views, clicks, and likes.

## Tools and Technologies

* SQL Server
* Python
* Power BI

## Project Workflow

Raw Data → Data Validation → Data Cleaning → Sentiment Analysis → Dashboard Development → Business Recommendations

## Data Validation

Before performing any analysis, the datasets were validated to identify potential data quality issues that could affect the accuracy of the results.

The validation process focuses on checking:
- Duplicate records
- Missing values
- Inconsistent text formatting
- Invalid or unexpected values
- Data consistency across tables

This step ensures that the datasets are reliable before moving on to data cleaning and transformation.

## Data Cleaning & Transformation

After validating the datasets, data cleaning and transformation were performed to improve data quality and prepare the data for analysis.

The cleaning process includes:

* Removing logical duplicate records
* Standardizing text values and formatting
* Trimming unnecessary whitespace
* Splitting combined columns into meaningful attributes
* Preserving valid NULL values where they represent actual business events
* Creating cleaned datasets for further analysis in Python and Power BI

These transformations ensure consistency across the datasets and provide a reliable foundation for downstream analytics.

## Exploratory Data Analysis (EDA)

Before applying sentiment analysis, exploratory data analysis was performed to understand the structure and quality of the cleaned datasets.

The analysis focused on:

* Examining customer review data
* Understanding rating distributions
* Identifying missing values and text inconsistencies
* Exploring review lengths and common patterns
* Preparing the data for sentiment classification

This step provides a better understanding of the data and ensures it is suitable for further analysis using Python.

## Sentiment Analysis

Customer reviews were analyzed using Python to understand overall customer sentiment and identify how customers perceive different products and services.

The analysis includes:

* Classifying customer reviews into Positive, Neutral, and Negative sentiment
* Calculating sentiment scores for each review
* Preparing sentiment labels for business reporting and dashboard visualization

The processed sentiment data is exported for further analysis in Power BI.

## Project Status

Data validation and exploration currently in progress.
