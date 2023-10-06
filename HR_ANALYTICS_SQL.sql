SELECT * FROM employeedatabase.hr_analytics_combine_sheet_csv limit 10;

# KPI1--Average Attrition rate for all Departments--#
SELECT Department, 
       AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100 AS AvgAttritionRatePercentage
FROM employeedatabase.hr_analytics_combine_sheet_csv
GROUP BY Department;


# KPI2--Average Hourly rate of Male Research Scientist--#
SELECT AVG(HourlyRate) AS AvgHourlyRate
FROM employeedatabase.hr_analytics_combine_sheet_csv
WHERE Gender = 'Male' AND JobRole = 'Research Scientist';


# KPI3--Attrition rate Vs Monthly income stats--#
SELECT Attrition,
       AVG(MonthlyIncome) AS AvgMonthlyIncome,
       MIN(MonthlyIncome) AS MinMonthlyIncome,
       MAX(MonthlyIncome) AS MaxMonthlyIncome,
       COUNT(*) AS TotalEmployees
FROM employeedatabase.hr_analytics_combine_sheet_csv
GROUP BY Attrition;


# KPI4--Average working years for each Department--#
SELECT Department, AVG(TotalWorkingYears) AS AvgWorkingYears
FROM employeedatabase.hr_analytics_combine_sheet_csv
GROUP BY Department;


# KPI5--Job Role Vs Work life balance--#
SELECT JobRole,
       AVG(WorkLifeBalance) AS AvgWorkLifeBalance,
       COUNT(*) AS TotalEmployees
FROM employeedatabase.hr_analytics_combine_sheet_csv
GROUP BY JobRole;


# KPI6--Attrition rate Vs Year since last promotion relation--#
SELECT YearsSinceLastPromotion,
       COUNT(*) AS TotalEmployees,
       (COUNT(CASE WHEN Attrition = 'Yes' THEN 1 ELSE NULL END) / COUNT(*) * 100) AS AttritionCountPercentage
FROM employeedatabase.hr_analytics_combine_sheet_csv
GROUP BY YearsSinceLastPromotion;

#--------##Other Additional Insights##--------#

#KPI7--Average Age by Department--#
SELECT Department, AVG(Age) AS AvgAge
FROM employeedatabase.hr_analytics_combine_sheet_csv
GROUP BY Department;



