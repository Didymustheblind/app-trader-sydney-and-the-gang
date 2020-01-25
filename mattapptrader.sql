/*
App Trader will purchase apps for 10,000 times the price of the app. For apps that are priced from 
free up to $1.00, the purchase price is $10,000.
Apps earn $5000 per month on average from in-app advertising and in-app purchases regardless of the 
price of the app.
App Trader will spend an average of $1000 per month to market an app regardless of the price of the app
For every half point that an app gains in rating, its projected lifespan increases by one year, in other words, 
an app with a rating of 0 can be expected to be in use for 1 year, an app with a rating of 1.0 can be expected 
to last 3 years, and an app with a rating of 4.0 can be expected to last 9 years. Ratings should be rounded to 
the nearest 0.5 to evaluate its likely longevity.
App Trader would prefer to work with apps that are available in both the App Store and the Play Store since they 
can market both for the same $1000 per month.

Deliverables
Develop some general recommendations as to price range, genre, content_rating for apps that the company should target.
Develop a Top 10 List of the apps that App Trader should buy next week for its Black Friday debut.
Prepare a 5-10 minute presentation for the leadership team of App Trader.
*/

-- Join the two tables on name, how many rows of data are in the join?
SELECT COUNT(*)
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
-- 553 rows

-- How many apps have a content rating of Everyone or 4+?
SELECT COUNT(*)
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
WHERE a.content_rating = '4+' AND p.content_rating = 'Everyone';
-- 302 apps from both tables 55% of all apps

-- Can I use the above query as a subquery in a FROM statement to return the count of all content ratings?
SELECT *
	FROM app_store_apps AS a
	INNER JOIN play_store_apps AS p
	ON a.name = p.name
	WHERE a.content_rating = '4+' AND p.content_rating = 'Everyone';

-- Let's look at the genre ratings for each table and see if there are any correlations. 
SELECT DISTINCT(content_rating)
FROM app_store_apps
UNION
SELECT content_rating
FROM play_store_apps
ORDER BY content_rating;

-- How can I return results that show the percentage of content ratings within each table?


-- Top 7 code ??
SELECT DISTINCT a.name, round (((a.rating + b.rating) / 2), 2) as avg_rating From play_store_apps as a
Inner join app_store_apps as b
On a.name = b.name
Order by avg_rating desc

--WHERE a.price <= 0.99 AND p.price <= '.99' AND ROUND(((a.rating + p.rating)/2),2) >= 4.25;

SELECT DISTINCT(content_rating)
FROM app_store_apps;

-- Are there any other currencies listed?
SELECT DISTINCT(currency)
FROM app_store_apps;
-- Only USD is listed

-- What is the price range of all apps on app_store?
SELECT DISTINCT(price)
FROM app_store_apps
ORDER BY price DESC;

-- What is the average price of apps from app_store?
SELECT AVG(price)
FROM app_store_apps;
-- $1.73 per app

-- How many apps from app_store are free?
SELECT COUNT(price)
FROM app_store_apps
WHERE price = 0.00;
-- 4056 free apps

-- Check the price on apps where the rating is greater than 4.25 from app store
SELECT ROUND(AVG(price), 2)
FROM app_store_apps
WHERE rating >= 4.25;







