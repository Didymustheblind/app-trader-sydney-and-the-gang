WITH cte1 AS (SELECT DISTINCT s.name, 
 				price, 
 				rating, 
				currency,
				s.life_span,
				ROUND(s.life_span*(5000*12)) AS a_revenue, 
				ROUND(s.app_cost) AS app_cost,
				ROUND(s.life_span*(5000*12) - (s.app_cost)) AS a_ebt,
				content_rating,
				primary_genre
			FROM(
				SELECT DISTINCT name, price, currency,
 				CASE WHEN price = 0.00 OR price <= 0.99 THEN 10000+(1000*12)*((rating*2)+1)
 					 WHEN price > 0.99 THEN (price*10000)+(1000*12)*((rating*2)+1)
				END AS app_cost,				 
 				rating,
				(rating*2)+1 AS life_span,	--life span in term of year			
				content_rating,
				primary_genre
		FROM app_store_apps) AS s
		ORDER BY a_ebt DESC), --;
		

cte2 AS	(SELECT DISTINCT sq.name, 
			--	a.price, 
				sq.new_price,
				sq.round_rating, 
			--	a.rating,
				sq.longevity,sq.p_revenue,
				ROUND(sq.play_app_cost) AS play_app_cost,
				ROUND(sq.p_revenue - sq.play_app_cost) AS p_ebt,
				sq.install_count,
				sq.content_rating,
				genres
		FROM	
			(SELECT DISTINCT p.name,
	   			new_price,
	   			round_rating,
	   			(round_rating*2)+1 AS longevity,
	   			ROUND(((round_rating*2)+1)*(5000*12)) AS p_revenue, 
	   			CASE WHEN new_price = 0.00 OR new_price <= 0.99 THEN 10000+(1000*12)*((round_rating*2)+1)
	   				 WHEN new_price > 0.99 THEN (new_price*10000)+(1000*12)*((round_rating*2)+1)
					 END AS play_app_cost,
	 			install_count,
				content_rating,
				genres	   
	   
		FROM(
			SELECT DISTINCT name,
				CAST(REPLACE(price,'$','') AS numeric(5,2)) AS new_price,
				ROUND(COALESCE(rating, 0) / 0.5, 0)* 0.5 AS round_rating, -- to round down or round up by half point
				install_count,
 				content_rating, 
				genres
			FROM play_store_apps)As p
		ORDER BY round_rating DESC) AS sq
ORDER BY p_ebt DESC) --;


SELECT DISTINCT a.name, 
				cte2.new_price, 
				cte2.round_rating, 
				a_ebt, p_ebt, 
				ROUND((a_ebt + p_ebt)/2) as Avg_ebt, 
				cte2.content_rating, 
				cte1.primary_genre
FROM app_store_apps AS a
INNER JOIN cte1
ON a.name = cte1.name
INNER JOIN cte2
ON a.name = cte2.name
ORDER BY avg_ebt DESC
LIMIT 20;