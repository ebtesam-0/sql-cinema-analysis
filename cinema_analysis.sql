-- ========================================
-- SQL Cinema Analysis 🎬
-- ========================================


-- 🎬 1. Number of tickets per movie genre
SELECT 
    Movie_Genre, 
    COUNT(Ticket_ID) AS Total_Tickets
FROM cinema_hall_ticket_sales
GROUP BY Movie_Genre;


-- 👥 2. Total number of persons per ticket
SELECT 
    Ticket_ID, 
    SUM(Number_of_Person) AS Total_Persons
FROM cinema_hall_ticket_sales
GROUP BY Ticket_ID;


-- 🪑 3. Most preferred seat type
SELECT 
    Seat_Type, 
    COUNT(*) AS Seat_Count
FROM cinema_hall_ticket_sales
GROUP BY Seat_Type
ORDER BY Seat_Count DESC
LIMIT 1;


-- 🔁 4. Percentage of customers who purchase again
SELECT 
    (COUNT(CASE WHEN Purchase_Again = 'Yes' THEN 1 END) * 100.0) / COUNT(*) 
    AS Purchase_Again_Percentage
FROM cinema_hall_ticket_sales;


-- 👑 5. Average age of VIP customers
SELECT 
    AVG(Age) AS Average_Age_VIP
FROM cinema_hall_ticket_sales
WHERE Seat_Type = 'VIP';


-- 🪑 6. Total tickets per seat type
SELECT 
    Seat_Type, 
    COUNT(*) AS Total_Tickets
FROM cinema_hall_ticket_sales
GROUP BY Seat_Type
ORDER BY Total_Tickets DESC;


-- 💰 7. Revenue per seat type
SELECT 
    Seat_Type, 
    SUM(Ticket_Price * Number_of_Person) AS Total_Revenue
FROM cinema_hall_ticket_sales
GROUP BY Seat_Type
ORDER BY Total_Revenue DESC;


-- 🔁 8. Customers who would purchase again by genre
SELECT 
    Movie_Genre, 
    COUNT(*) AS People_Would_Purchase_Again
FROM cinema_hall_ticket_sales
WHERE Purchase_Again = 'Yes'
GROUP BY Movie_Genre
ORDER BY People_Would_Purchase_Again DESC;


-- 🎬🪑 9. Tickets by genre and seat type
SELECT 
    Movie_Genre, 
    Seat_Type, 
    COUNT(*) AS Total_Tickets
FROM cinema_hall_ticket_sales
GROUP BY Movie_Genre, Seat_Type;


-- 💰 10. Revenue per movie genre
SELECT 
    Movie_Genre, 
    SUM(Ticket_Price * Number_of_Person) AS Total_Revenue
FROM cinema_hall_ticket_sales
GROUP BY Movie_Genre;


-- 🏆 11. Most popular genre and seat combination
SELECT 
    Movie_Genre, 
    Seat_Type, 
    COUNT(Ticket_ID) AS Total_Tickets
FROM cinema_hall_ticket_sales
GROUP BY Movie_Genre, Seat_Type
ORDER BY Total_Tickets DESC
LIMIT 1;


-- 👶 12. Ticket distribution by age group
SELECT
    CASE 
        WHEN Age < 20 THEN 'Under 20'
        WHEN Age BETWEEN 20 AND 30 THEN '21-30'
        WHEN Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        WHEN Age > 50 THEN 'Above 50'
    END AS Age_Group,
    COUNT(Ticket_ID) AS Total_Tickets
FROM cinema_hall_ticket_sales
GROUP BY Age_Group;
