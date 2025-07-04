-- Indexes to improve performance on frequently queried columns

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