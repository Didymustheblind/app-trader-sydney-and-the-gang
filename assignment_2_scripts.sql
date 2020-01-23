--avg: 444152
/*
SELECT ROUND(AVG(review_count),2)
FROM play_store_apps;
*/

--Genre 'Food & Drink': Starbucks, Dominoes
--Genre 'Shopping': Wish
--Genre 'Travel': Uber
--Genre 'Games': Fernanfloo, Zombie Catchers, Egg, Inc.
SELECT a.name, p.review_count AS p_review_count, p.rating AS p_rating,
a.price AS a_price, a.primary_genre AS genre, 
a.content_rating AS a_content_rating, p.content_rating AS p_content_rating,
p.install_count, p.size AS app_size
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
	WHERE p.review_count > 444152
		AND p.rating >= 4.0
		AND a.price <= 1
		--AND p.content_rating = 'Everyone'
		--AND a.primary_genre = 'Food & Drink'
		--AND a.primary_genre = 'Shopping'
		--AND a.primary_genre = 'Travel'
		AND a.primary_genre = 'Games'
ORDER BY p_rating DESC;

--Genres: Games, Shopping, Music, Health & Fitness, Food & Drink, Book, Business, Education, Social Networking, Travel, News
/*
SELECT DISTINCT primary_genre
FROM app_store_apps;
*/