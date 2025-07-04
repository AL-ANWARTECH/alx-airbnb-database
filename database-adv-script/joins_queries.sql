-- 1. INNER JOIN: Get all bookings and the users who made them
SELECT b.booking_id, b.start_date, b.end_date, b.total_price, b.status, u.user_id, u.first_name, u.last_name, u.email
FROM Booking b
    INNER JOIN User u ON b.user_id = u.user_id
ORDER BY b.start_date DESC;
-- Bookings ordered by most recent

-- 2. LEFT JOIN: Get all properties and their reviews (even properties with no reviews)
SELECT p.property_id, p.name AS property_name, p.location, r.review_id, r.rating, r.comment
FROM Property p
    LEFT JOIN Review r ON p.property_id = r.property_id
ORDER BY p.name ASC;
-- Alphabetical order of properties

-- 3. FULL OUTER JOIN: Get all users and all bookings, even if no match exists
-- Note: FULL OUTER JOIN simulated using UNION in MySQL
(
    SELECT u.user_id, u.first_name, u.last_name, b.booking_id, b.property_id, b.start_date, b.end_date
    FROM User u
        LEFT JOIN Booking b ON u.user_id = b.user_id
    UNION
    SELECT u.user_id, u.first_name, u.last_name, b.booking_id, b.property_id, b.start_date, b.end_date
    FROM Booking b
        RIGHT JOIN User u ON u.user_id = b.user_id
)
ORDER BY start_date DESC;
-- Order by booking date