-- Basic: view all cleaned records
SELECT * FROM cybercrime;

-- GROUP BY: total cases per city (across both years)
SELECT "City", SUM("Total") AS total_cases
FROM cybercrime
GROUP BY "City";

-- ORDER BY: same query, ranked highest to lowest
SELECT "City", SUM("Total") AS total_cases
FROM cybercrime
GROUP BY "City"
ORDER BY total_cases DESC;

-- HAVING: only cities with more than 500 total cases
SELECT "City", SUM("Total") AS total_cases
FROM cybercrime
GROUP BY "City"
HAVING SUM("Total") > 500
ORDER BY total_cases DESC;

-- CASE: classify each city-year record into High/Medium/Low crime level
SELECT
    "City",
    "Year",
    "Total",
    CASE
        WHEN "Total" >= 200 THEN 'High'
        WHEN "Total" >= 50 THEN 'Medium'
        ELSE 'Low'
    END AS crime_level
FROM cybercrime
ORDER BY "Total" DESC;

-- Window function: rank cities within each year by total cases
SELECT
    "City",
    "Year",
    "Total",
    RANK() OVER (PARTITION BY "Year" ORDER BY "Total" DESC) AS rank_in_year
FROM cybercrime
ORDER BY "Year", rank_in_year;