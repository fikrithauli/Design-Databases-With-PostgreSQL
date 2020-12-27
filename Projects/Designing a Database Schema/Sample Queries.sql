-- Sample Queries
'''
  displays the restaurant name, its address (street number and name) and telephone number.
'''
SELECT 
  restaurant.name,
  address.street_number,
  address.street_name,
  restaurant.telephone
FROM restaurant 
INNER JOIN address ON restaurant.id = address.restaurant_id;

'''
  query to get the best rating the restaurant ever received.
'''
SELECT 
  restaurant.name,
  MAX(review.rating) AS best_rating
FROM restaurant 
INNER JOIN review ON restaurant.id = review.restaurant_id
GROUP BY restaurant.name;

'''
  display a dish name, its price and category sorted by the dish name
'''
SELECT 
  dish.name AS dish_name,
  categories_dishes.price AS price,
  category.name AS category
FROM dish 
INNER JOIN categories_dishes ON dish.id = categories_dishes.dish_id
INNER JOIN category ON category.id = categories_dishes.category_id
ORDER BY dish_name;

'''
  display a dish name, its price and category sorted by category name
'''
SELECT 
  category.name AS category,
  dish.name AS dish_name,
  categories_dishes.price AS price
FROM dish 
INNER JOIN categories_dishes ON dish.id = categories_dishes.dish_id
INNER JOIN category ON category.id = categories_dishes.category_id
ORDER BY category;

'''
  displays all the spicy dishes, their prices and category. 
'''
SELECT
  dish.name AS spicy_dish_name,
  category.id AS category,
  categories_dishes.price AS price
FROM dish 
INNER JOIN categories_dishes ON dish.id = categories_dishes.dish_id
INNER JOIN category ON category.id = categories_dishes.category_id
WHERE dish.hot_and_spicy = 'true';

'''
  display only the dish(es) from the menu table which appears more than once.
'''
SELECT 
  dish_id,
  dish.name,
  COUNT(dish_id)
FROM categories_dishes
INNER JOIN dish ON dish.id = categories_dishes.dish_id
GROUP BY dish_id, dish.name
HAVING COUNT(dish_id) > 1
ORDER BY dish_id;

'''
  displays the best rating as best_rating and the description
'''
SELECT 
  rating,
  comment
FROM review 
WHERE rating = (SELECT MAX(rating) FROM review);