Select distinct a.name, a.price, b.price, round (((a.rating + b.rating) / 2), 2) as avg_rating From play_store_apps as a 
Inner join app_store_apps as b 
--On a.rating = b.rating and 
On a.name = b.name
Order by avg_rating desc;

