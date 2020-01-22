Select * 
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name;

