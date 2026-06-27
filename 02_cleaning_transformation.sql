/*
=====================================================================================================
    File        : 02_cleaning_transformation.sql
    Project     : Ecommerce Customer Behavior Analysis
    Author      : Samarth Pawar
    Description : Cleans and transforms the ShopEasy datasets to improve
                  data quality and prepare them for analysis in Python
                  and Power BI.

    Tables      : customer_journey, customer_reviews, engagement_data

    Note        : Cleaned tables are created separately.
                  Original datasets remain unchanged.
=====================================================================================================
*/

-- 1. REMOVE DUPLICATES

with duplicates as -- -- Create a Common Table Expression (CTE) to identify logical duplicate records.
	(
   select
	JourneyID,
	CustomerID,
	ProductID,
	VisitDate,
	Stage,
	Action,
	Duration,
  row_number()    -- Assign a row number to each record within the same business key.
			      -- Records with Row_Number = 1 will be retained
over(partition by CustomerID,ProductID,VisitDate,Stage,Action order by  JourneyID ) as rnk 
	  
from customer_journey)

select 
JourneyID,
CustomerID,
ProductID,
VisitDate,
Stage,
Action,
Duration
into dbo.customer_journey_cleaned
from duplicates
where rnk = 1  
-- Create a cleaned customer journey table after removing logical duplicates.

-- Step 2: Standardize Stage Values

update [dbo].[customer_journey_cleaned]
set Stage =
case 
	when upper(Stage) = 'CHECKOUT' THEN 'Checkout'
	when upper(Stage)=  'HOMEPAGE' THEN 'Homepage'
	when upper(Stage) = 'PRODUCTPAGE' THEN 'ProductPage'
	else Stage 
	end 
from [dbo].[customer_journey_cleaned]

-- Result: Stage standardized to 3 consistent values
-- Checkout, Homepage, ProductPage

-- Step 3: Clean and Transform Engagement Data

select 
 EngagementID,
 ContentID,
 case 
	when upper(ContentType)='BLOG' then 'Blog'
	when upper(ContentType)='SOCIALMEDIA' then 'Socialmedia'
	when upper(ContentType)='VIDEO' then 'Video'
	when upper(ContentType)='NEWSLETTER' then 'Newsletter'
	else ContentType
	end as ContentType,
likes,
convert(date,EngagementDate) as  EngagementDate,
CampaignID,
ProductID,
convert(int ,LEFT(ViewsClicksCombined, CHARINDEX('-', ViewsClicksCombined) - 1)) AS Views,
convert(int,right(ViewsClicksCombined,len(ViewsClicksCombined)- CHARINDEX('-', ViewsClicksCombined))) as clicks
INTO dbo.engagement_data_cleaned
from [dbo].[engagement_data]

-- Create a cleaned customer journey table after removing logical duplicates.
-- ContentType standardized to consistent casing

-- Step 4: Clean Customer Review Text


select
ReviewID,
CustomerID,
ProductID,
ReviewDate,
Rating,
trim(replace(ReviewText,'  ',' ')) as ReviewText
into  dbo.customer_reviews_cleaned
from [dbo].[customer_reviews]

-- Create a cleaned customer journey table after removing logical duplicates.
-- TRIM() removed leading/trailing spaces
-- REPLACE() fixed double spaces between words
-- Note: Further text normalization handled in Python using regex