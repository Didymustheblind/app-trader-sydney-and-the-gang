
--Genre 'Games': Fernanfloo, Narcos: Cartel Wars, Solitaire

SELECT DISTINCT a.name, ROUND(((a.rating + p.rating)/ 2), 2) AS avg_rating,
a.price AS app_price, p.price AS play_price, a.primary_genre AS app_genre,
p.genres AS play_genre, p.install_count, a.content_rating AS a_content_rating,
p.content_rating AS p_content_rating
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
	WHERE (
			p.review_count > 1000
			AND a.review_count > '1000'
			AND ROUND(((a.rating + p.rating)/2), 2) >= 4.25
			AND a.price < 2
		  )
	AND (
			a.primary_genre = 'Food & Drink'
			OR a.primary_genre = 'Shopping'
			OR a.primary_genre = 'Games'
			OR a.primary_genre = 'News'
		)
ORDER BY avg_rating DESC;