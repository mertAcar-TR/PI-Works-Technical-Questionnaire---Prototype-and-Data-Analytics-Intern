UPDATE df
SET daily_vaccinations = (
    SELECT COALESCE(t.daily_vaccinations, m.median_daily_vaccinations) AS daily_vaccinations
    FROM YourTableName t
    LEFT JOIN (
        SELECT country, MEDIAN(daily_vaccinations) AS median_daily_vaccinations
        FROM df
        WHERE daily_vaccinations IS NOT NULL
        GROUP BY country
    ) m ON t.country = m.country
    WHERE df.country = t.country AND df.date = t.date
)
WHERE EXISTS (
    SELECT 1
    FROM (
        SELECT country, date
        FROM df
        GROUP BY country, date
    ) AS subquery
    WHERE subquery.country = df.country AND subquery.date = df.date
);

