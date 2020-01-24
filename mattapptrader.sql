/*
Based on research done before launching App Trader as a company, you can assume 
the following:

-App Trader will purchase apps for 10,000 times the price of the app. 
-For apps that are priced from free up to $1.00, the purchase price is $10,000.
-Apps earn $5000 per month on average from in-app advertising and in-app purchases 
regardless of the price of the app
-App Trader will spend an average of $1000 per month to market an app regardless 
of the price of the app
-For every half point that an app gains in rating, its projected lifespan increases 
by one year, in other words, an app with a rating of 0 can be expected to be in use 
for 1 year, an app with a rating of 1.0 can be expected to last 3 years, and an app 
with a rating of 4.0 can be expected to last 9 years. Ratings should be rounded to 
the nearest 0.5 to evaluate its likely longevity.
-App Trader would prefer to work with apps that are available in both the App Store 
and the Play Store since they can market both for the same $1000 per month.

Deliverables
Develop some general recommendations as to price range, genre, content_rating for 
apps that the company should target.
Develop a Top 10 List of the apps that App Trader should buy next week for its 
Black Friday debut.
Prepare a 5-10 minute presentation for the leadership team of App Trader.

***Initial questions
1. App trader prefers to work with apps that are available on both platforms. Would there be any 
expceptions to this rule? Good performance, etc.
	A. Find out if there are any top performing apps that are only available in either app store or 
	play store. What constitutes good performance?
2. What columns can I reliably join the app_store_apps table and the play_store_apps table so that 
I may explore the cross platform apps preferred by App Trader?
3. If App Trader will purchase apps for 10,000 times the price of the app, what does this imply?
4. What free apps and paid apps costing up to $1 might be of interest?
5. No matter the price of the app, they earn about $5000 per month on average, so the less money spent
the better the profit margin.
6. Apps with a rating of 4 will last 9 years, but an app with a rating of 1 will last 3 years. 
7. Which genres perform the best? Which content rating?
8. How do higher priced apps compare to free apps (rating, review count, etc)?
*/

-- App Store column names: name/size/currency/price/review_count/rating/content_rating/genres
-- Play Store column names: name/category/rating/review_count/size/install_count/type/price/content_rating/genres

ALTER TABLE app_store_apps
DROP COLUMN currency;

ALTER TABLE app_store_apps
RENAME COLUMN genre TO genres;

ALTER TABLE app_store_apps
RENAME COLUMN size_bytes TO size;

ALTER TABLE app_store_apps
DROP COLUMN size_bytes TO size;

SELECT *
FROM app_store_apps;


-- Which genre has the most titles in app store?
SELECT primary_genre, COUNT(primary_genre)
FROM app_store_apps
GROUP BY primary_genre;

-- Which genre has the most titles in play store?
SELECT genres, COUNT(genres)
FROM play_store_apps
GROUP BY genres;

--Create inner join based on app name.

SELECT *
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name;

--This table has 553 rows total. How many rows have been omitted?


SELECT genres, rating
FROM play_store_apps
WHERE rating > 4
GROUP BY genres, rating
ORDER BY rating DESC;

SELECT * 
FROM app_store_apps;

SELECT *
FROM play_store_apps;

