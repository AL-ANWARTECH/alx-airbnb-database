-- USER TABLE INDEXES
CREATE INDEX idx_user_email ON User (email);

CREATE INDEX idx_user_role ON User (role);

-- PROPERTY TABLE INDEXES
CREATE INDEX idx_property_location ON Property (location);

CREATE INDEX idx_property_host_id ON Property (host_id);

-- BOOKING TABLE INDEXES
CREATE INDEX idx_booking_user_id ON Booking (user_id);

CREATE INDEX idx_booking_property_id ON Booking (property_id);

CREATE INDEX idx_booking_dates ON Booking (start_date, end_date);

-- EXPLAIN ANALYZE: Check if indexes are used

-- 1. Check if index on user_id in Booking is used
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE
    user_id = '00000000-0000-0000-0000-000000000001';

-- 2. Check if composite index on (start_date, end_date) is used
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE
    start_date >= '2024-07-01'
    AND end_date <= '2024-07-31';

-- 3. Check if host_id index in Property table is used
EXPLAIN ANALYZE
SELECT *
FROM Property
WHERE
    host_id = '00000000-0000-0000-0000-000000000011';

-- 4. Check if email index in User is used
EXPLAIN ANALYZE SELECT * FROM User WHERE email = 'host@example.com';