-- =========================================
-- Initial Complex Query (Unoptimized)
-- Retrieves all confirmed bookings with user, property, and payment details
-- =========================================

-- Performance analysis using EXPLAIN ANALYZE (PostgreSQL)
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM
    Booking b
    JOIN User u ON b.user_id = u.user_id
    JOIN Property p ON b.property_id = p.property_id
    LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE
    b.status = 'confirmed'
    AND b.start_date >= '2024-07-01'
    AND b.start_date < '2024-08-01'
ORDER BY b.start_date DESC;