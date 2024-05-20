SELECT 
    SUBSTRING(
        LOWER(Stats_Access_Link), 
        CHARINDEX('://', LOWER(Stats_Access_Link)) + 3, 
        CHARINDEX('/', LOWER(Stats_Access_Link), CHARINDEX('://', LOWER(Stats_Access_Link)) + 4) - (CHARINDEX('://', LOWER(Stats_Access_Link)) + 3)
    ) AS Saf_URL
FROM 
    DeviceStats
WHERE 
    LOWER(Stats_Access_Link) LIKE '%://[a-z0-9_.]%/%' ESCAPE '/'