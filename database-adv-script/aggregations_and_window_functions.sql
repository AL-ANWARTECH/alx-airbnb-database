-- 1. Aggregation: Total number of bookings made by each user
SELECT u.user_id, u.first_name, u.last_name, COUNT(b.booking_id) AS total_bookings
FROM User u
    LEFT JOIN Booking b ON u.user_id = b.user_id
GROUP BY
    u.user_id,
    u.first_name,
    u.last_name
ORDER BY total_bookings DESC;

-- 2. Window Function: Rank properties based on number of bookings
SELECT
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (
        ORDER BY COUNT(b.booking_id) DESC
    ) AS booking_rank
FROM Property p
    LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY
    p.property_id,
    p.name
ORDER BY booking_rank;

-- 3. Window Function: Row number for properties based on booking count
SELECT
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (
        ORDER BY COUNT(b.booking_id) DESC
    ) AS row_number
FROM Property p
    LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY
    p.property_id,
    p.name
ORDER BY row_number;