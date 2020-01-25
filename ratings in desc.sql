Select distinct a.name, a.price, b.price, a.rating, b.rating as avg_rating From play_store_apps as a
Inner join app_store_apps as b
On a.name = b.name
Order by avg_rating desc, rating desc;