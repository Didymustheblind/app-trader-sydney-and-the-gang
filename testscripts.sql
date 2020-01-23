SELECT DISTINCT a.name, a.price, ROUND(a.rating,1) AS rating, a. content_rating AS app_content_rating,p.content_rating AS play_content_rating, a.primary_genre AS genre,
	CASE WHEN a.rating <= 0.5 THEN '1 Year'
		 WHEN a.rating > 0.5 AND a.rating <= 1 THEN '2 Year' 
		 WHEN a.rating > 1 AND a.rating <=1.5 THEN '3 Year'
		 WHEN a.rating > 1.5 AND a.rating <=2 THEN '4 Year'
		 WHEN a.rating > 2 AND a.rating <=2.5 THEN '5 Year'
		 WHEN a.rating > 2.5 AND a.rating <=3 THEN '6 Year'
		 WHEN a.rating > 3 AND a.rating <=3.5 THEN '7 Year'
		 WHEN a.rating > 3.5 AND a.rating <=4 THEN '8 Year'
		 WHEN a.rating > 4 AND a.rating <=4.5 THEN '9 Year'
		 WHEN a.rating > 4.5 AND a.rating <=5 THEN '11 Year'
		 ELSE 'others' END AS longevity
FROM app_store_apps as a
JOIN play_store_apps as p
ON a.name = p.name
ORDER BY rating DESC,longevity DESC
LIMIT 10;