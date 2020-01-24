--avg: 444152
/*
SELECT ROUND(AVG(review_count),2)
FROM play_store_apps;
*/

--Genre 'Food & Drink': Starbucks, Dominoes, DoorDash
--Genre 'Shopping': Wish, Best Buy
--Genre 'Travel': Airbnb
--Genre 'Games': Fernanfloo, Zombie Catchers, Egg, Inc.

/*
SELECT a.name, p.review_count AS p_review_count, 
a.review_count AS a_review_count,
ROUND(((a.rating + p.rating)/ 2), 2) AS avg_rating,
a.price AS app_price, p.price AS play_price, 
a.primary_genre AS a_genre, p.genres AS p_genre,
a.content_rating AS a_content_rating, 
p.content_rating AS p_content_rating
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
	WHERE p.review_count > 1000
		AND a.review_count > '1000'
		AND ROUND(((a.rating + p.rating)/ 2), 2) >= 4.25
		AND a.price <= 1
		AND p.price <= '1'
		--AND p.content_rating = 'Everyone'
		--AND a.primary_genre = 'Food & Drink'
		--AND a.primary_genre = 'Shopping'
		--AND a.primary_genre = 'Travel'
		--AND a.primary_genre = 'Games'
ORDER BY avg_rating DESC;
*/

SELECT DISTINCT a.name, ROUND(((a.rating + p.rating)/ 2), 2) AS avg_rating,
a.price AS app_price, p.price AS play_price, a.primary_genre AS app_genre,
p.genres AS play_genre
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
	WHERE p.review_count > 1000
		AND a.review_count > '1000'
		AND ROUND(((a.rating + p.rating)/2), 2) >= 4.25
ORDER BY avg_rating DESC;


--Genres: Games, Shopping, Food & Drink, Travel
/*
SELECT DISTINCT primary_genre
FROM app_store_apps;
*/

--Content Rating: Everyone, Everyone 10+, Teen
/*
SELECT DISTINCT content_rating
FROM play_store_apps;
*/