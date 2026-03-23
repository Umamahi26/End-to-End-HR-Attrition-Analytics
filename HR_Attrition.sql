-- TOTAL EMPLOYEES
SELECT
	COUNT(DISTINCT Employee_ID) AS Total_Employees
FROM hr_data;

-- ATTRITION COUNT
SELECT
	SUM(CASE
			WHEN Attrition = 'Left' THEN 1 ELSE 0
			END) AS Attrition_Count
FROM hr_data;

-- AVERAGE JOB SATISFACTION
SELECT
	AVG(Satisfaction_Level) AS Avg_Job_Satisfaction
FROM hr_data;

-- ATTRITION RATE
SELECT 
ROUND(
    COUNT(CASE WHEN Attrition = 'Left' THEN 1 END) * 100.0 
    / COUNT(*),
2) AS Attrition_Rate
FROM hr_data;

-- JOB ROLE WISE ATTRITION
SELECT 
	Job_Role,
	COUNT(*) Employees,
	SUM(CASE WHEN Attrition='Left' THEN 1 ELSE 0 END) AS Attrition_Count
FROM hr_data
GROUP BY Job_Role
ORDER BY Attrition_Count DESC;

-- INCOME VS ATTRTION
SELECT
	Income_Slab,
	SUM(CASE WHEN Attrition = 'Left' THEN 1 ELSE 0 END) AS Attrition_Count
FROM hr_data
GROUP BY Income_Slab
ORDER BY Attrition_Count DESC;

-- EXPERIENCE VS ATTRITION
SELECT
	Experience_Group,
	SUM(CASE WHEN Attrition = 'Left' THEN 1 ELSE 0 END) AS Attrition_Count
FROM hr_data
GROUP BY Experience_Group
ORDER BY Attrition_Count DESC;

-- EXPERIENCE VS JOB SATISFACTION
SELECT Experience_Group,
COUNT(*) Employees,
AVG(Satisfaction_Level) AS Avg_Satisfaction
FROM hr_data
GROUP BY Experience_Group;

-- SALARY RANKING
SELECT 
Employee_ID,
Monthly_Income,
RANK() OVER(ORDER BY Monthly_Income DESC) Income_Rank
FROM hr_data;

-- HIGH PAYED EMPLOYEES
SELECT 
	Employee_ID,
	Monthly_Income
FROM hr_data
WHERE Monthly_Income > (
SELECT AVG(Monthly_Income) FROM hr_data);

-- JOB SATISFACTION VS ATTRITION
SELECT
	Job_Satisfaction,
	SUM(CASE WHEN Attrition = 'Left' THEN 1 ELSE 0 END) AS Attrition_Count
FROM hr_data
GROUP BY Job_Satisfaction
ORDER BY Attrition_Count DESC;

-- WORKLIFE BALANCE VS ATTRITION
SELECT
	Work_Life_Balance,
	SUM(CASE WHEN Attrition = 'Left' THEN 1 ELSE 0 END) AS Attrition_Count
FROM hr_data
GROUP BY Work_Life_Balance
ORDER BY Attrition_Count DESC;

-- PERFORMANCE RATING VS ATTRITION
SELECT
	Performance_Rating,
	SUM(CASE WHEN Attrition = 'Left' THEN 1 ELSE 0 END) AS Attrition_Count
FROM hr_data
GROUP BY Performance_Rating
ORDER BY Attrition_Count DESC;

-- PROMOTIONS VS ATTRITION
SELECT
	Number_of_Promotions,
	SUM(CASE WHEN Attrition = 'Left' THEN 1 ELSE 0 END) AS Attrition_Count
FROM hr_data
GROUP BY Number_of_Promotions
ORDER BY Attrition_Count DESC;

-- EMPLOYEE RECOGNITION VS ATTRITION
SELECT
	Employee_Recognition,
	SUM(CASE WHEN Attrition = 'Left' THEN 1 ELSE 0 END) AS Attrition_Count
FROM hr_data
GROUP BY Employee_Recognition
ORDER BY Attrition_Count DESC;


