/*
A table is created for all the items in my clothing store, with information on the clothing type,
brand, size, color, material type and price.
Using select statements to order my items by price, I show a few statistics about the items in my store.
*/

/*Create table for the clothing store*/
CREATE TABLE clothing_store (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    clothing_type TEXT,
    brand TEXT,
    size TEXT,
    color TEXT,
    material_type TEXT,
    unit_price FLOAT
);

/*Add records*/
INSERT INTO clothing_store (clothing_type, brand, size, color, material_type, unit_price)
VALUES
    ("T-shirt", "Nike", "M", "Black", "Cotton", 24.99),
    ("Jeans", "Levi's", "L", "Blue", "Denim", 49.99),
    ("Dress", "Calvin Klein", "S", "Red", "Silk", 89.99),
    ("Sweater", "Adidas", "L", "Gray", "Wool", 39.99),
    ("Shorts", "H&M", "S", "Green", "Cotton", 19.99),
    ("Blouse", "Zara", "M", "White", "Polyester", 29.99),
    ("Jacket", "The North Face", "L", "Black", "Nylon", 79.99),
    ("Skirt", "Mango", "XS", "Blue", "Cotton", 34.99),
    ("Polo Shirt", "Ralph Lauren", "L", "Navy", "Cotton", 59.99),
    ("Sweatpants", "Under Armour", "XL", "Gray", "Polyester", 44.99),
    ("Blazer", "Burberry", "M", "Beige", "Wool", 199.99),
    ("Hoodie", "Gap", "S", "Navy", "Cotton", 49.99),
    ("Tank Top", "Forever 21", "XS", "Pink", "Spandex", 14.99),
    ("Chinos", "Dockers", "M", "Khaki", "Cotton", 39.99),
    ("Coat", "Burberry", "L", "Black", "Cashmere", 299.99),
    ("Socks", "Hanes", "One Size", "White", "Cotton", 9.99),
    ("Sunglasses", "Ray-Ban", "One Size", "Black", "Plastic", 99.99),
    ("Hat", "New Era", "One Size", "Red", "Cotton", 19.99),
    ("Shoes", "Nike", "S", "Black/White", "Leather", 79.99),
    ("Belt", "Gucci", "One Size", "Brown", "Leather", 149.99),
    ("Swimsuit", "Speedo", "S", "Blue", "Polyester", 34.99),
    ("Sneakers", "Converse", "L", "Red", "Canvas", 54.99),
    ("Gloves", "The North Face", "M", "Black", "Fleece", 19.99),
    ("Scarf", "Burberry", "One Size", "Plaid", "Cashmere", 129.99),
    ("Trousers", "Zara", "L", "Gray", "Polyester", 39.99),
    ("Beanie", "Adidas", "One Size", "Black", "Acrylic", 14.99),
    ("Duffle Bag", "Louis Vuitton", "One Size", "Brown", "Canvas", 299.99),
    ("Umbrella", "Totes", "One Size", "Black", "Polyester", 19.99),
    ("Gym Bag", "Under Armour", "One Size", "Blue", "Nylon", 29.99),
    ("Wristwatch", "Rolex", "One Size", "Gold", "Gold", 999.99);
    
    /*Display records*/
SELECT * FROM clothing_store;
    
    /*Display records ordering by price*/
SELECT * FROM clothing_store ORDER BY unit_price;
	
    /*Display records of top 10 highest priced items*/
SELECT * FROM clothing_store ORDER BY unit_price
DESC LIMIT 10;
    
    /*The average price of items in the store*/
SELECT AVG(unit_price) AS average_price FROM clothing_store;
    
	/*Display records of material types and the number of items made with such material.
    Starting with the most used material type in the store*/
SELECT material_type, COUNT(*) AS material_count
FROM clothing_store
GROUP BY material_type
ORDER BY material_count DESC;

/*Display records of item colors and the number of items with such color.
    Starting with the most available item color in the store*/
SELECT color, COUNT(*) AS color_count
FROM clothing_store
GROUP BY color
ORDER BY color_count DESC;
    
/*Display records of clothing type and their average unit price.
    Starting with the highest average unit priced item in the store*/
SELECT clothing_type, AVG(unit_price) AS average_price
FROM clothing_store
GROUP BY clothing_type
ORDER BY average_price DESC;