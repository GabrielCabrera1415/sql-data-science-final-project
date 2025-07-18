SELECT *
FROM milk_production;

--1
SELECT SUM(REPLACE(Value, ',', '')) AS Total_Production
FROM milk_production
WHERE Year = 2023;

--2
SELECT SUM(REPLACE(Value, ',', '')) AS Total_Production
FROM coffee_production
WHERE Year = 2015;

--3
SELECT Year, AVG(REPLACE(Value, ',', '')) AS Production_Average
FROM honey_production
WHERE Year = 2022;

--4
SELECT State,State_ANSI
FROM state_lookup
WHERE State = "IOWA";

--5
SELECT MAX(Value)
FROM yogurt_production
WHERE Year = 2022;


--6
SELECT DISTINCT h.State_ANSI FROM honey_production h
JOIN milk_production m ON h.State_ANSI = m.State_ANSI
WHERE h.Year = 2022 AND m.Year = 2022;

SELECT h.State_ANSI
FROM honey_production h INNER JOIN (SELECT State_ANSI FROM milk_production WHERE Year = 2022) AS m
ON h.State_ANSI = m.State_ANSI
WHERE h.Year = 2022
GROUP BY h.State_ANSI;



--7
SELECT SUM(REPLACE(y.Value, ',', '')) AS Total_Production
FROM yogurt_production y INNER JOIN (SELECT State_ANSI FROM cheese_production GROUP BY State_ANSI) AS c ON y.State_ANSI = c.State_ANSI
WHERE Year = 2022
