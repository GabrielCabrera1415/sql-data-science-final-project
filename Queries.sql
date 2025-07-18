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


--1--
SELECT SUM(REPLACE(Value,',','')) AS TotalProduction
FROM milk_production
WHERE Year = 2023;


--2--
SELECT Count(State_ANSI)
FROM cheese_production
WHERE Value > 100000000 AND (Year = 2023 AND Period = "APR");


--3--
SELECT SUM(REPLACE(Value,',','')) AS TotalProduction
FROM coffee_production
WHERE Year = 2011;


--4--
SELECT AVG(REPLACE(Value,',','')) AS AverageTotalProduction
FROM honey_production
WHERE Year = 2022;


--5--
SELECT State_ANSI, State
FROM state_lookup
WHERE State = "FLORIDA";


--6--
SELECT State_ANSI, SUM(REPLACE(Value,',','')) AS TotalProduction
FROM cheese_production 
WHERE Period = "APR" AND Year = 2023 AND State_ANSI =(SELECT State_ANSI FROM state_lookup WHERE State = "NEW JERSEY");
GROUP BY State_ANSI;
--WHERE State_ANSI =(SELECT State_ANSI FROM state_lookup WHERE State = "NEW JERSEY");


--7--
SELECT SUM(REPLACE(y.Value,',','')) AS TotalProduction --,y.State_ANSI, y.Value,
FROM yogurt_production y INNER JOIN (SELECT State_ANSI FROM cheese_production WHERE Year = 2023 GROUP BY State_ANSI ) AS c ON c.State_ANSI = y.State_ANSI
WHERE y.Year = 2022;


--8--
SELECT COUNT(DISTINCT(s.State_ANSI)) AS Missing_States
FROM state_lookup s LEFT JOIN (SELECT m.State_ANSI FROM milk_production m WHERE m.Year = 2023 GROUP BY m.State_ANSI) AS m ON m.State_ANSI = s.State_ANSI
WHERE m.State_ANSI IS NULL;


--9--
SELECT s.State_ANSI,s.State,c.Value
FROM state_lookup s INNER JOIN (SELECT State_ANSI, Value FROM cheese_production WHERE Year = 2023 AND Period = "APR") AS c ON s.State_ANSI = c.State_ANSI;


--10--
SELECT AVG(CAST(REPLACE(co.Value, ',', '') AS INTEGER)) AS AverageCoffeeProduction
FROM coffee_production co WHERE co.Year IN (SELECT hp.Year FROM honey_production hp GROUP BY hp.Year HAVING SUM(CAST(REPLACE(hp.Value, ',', '') AS INTEGER)) > 1000000);
