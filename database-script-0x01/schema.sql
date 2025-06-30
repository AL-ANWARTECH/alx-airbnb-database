-- User Table
CREATE TABLE User (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    phone_number VARCHAR(20),
    role VARCHAR(10) CHECK (
        role IN ('guest', 'host', 'admin')
    ) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Property Table
CREATE TABLE Property (
    property_id UUID PRIMARY KEY,
    host_id UUID NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    location VARCHAR(255) NOT NULL,
    pricepernight DECIMAL(10, 2) NOT NULL CHECK (pricepernight >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Foreign Key (host_id) REFERENCES (user_id) ON DELETE CASCADE
);

-- Booking Table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) Not NULL CHECK (total_price >= 0),
    status VARCHAR(10) CHECK (
        status IN (
            'pending',
            'confirmed',
            'canceled'
        )
    ) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Foreign Key (user_id) REFERENCES User (user_id) ON DELETE CASCADE,
    Foreign Key (user_id) REFERENCES User (user_id) ON DELETE CASCADE
);

--Payment Table
CREATE TABLE Payment (
    payment_id UUID PRIMARY KEY,
    booking_id UUID UNIQUE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL CHECK (amount >= 0),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(20) CHECK (
        payment_method IN (
            'credit_card',
            'paypal',
            'stripe'
        )
    ) NOT NULL,
    Foreign Key (booking_id) REFERENCES Booking (booking_id) ON DELETE CASCADE
);

-- Review Table
CREATE Table Review (
    review_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5) NOT NULL,
    comment TEXT,
    Foreign Key (property_id) REFERENCES Property (property_id) ON DELETE CASCADE,
    Foreign Key (user_id) REFERENCES User (user_id) ON DELETE CASCADE
);

-- Message Table
CREATE Table Message (
    message_id UUID PRIMARY KEY,
    sender_id UUID NOT NULL,
    recipient_id UUID NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Foreign Key (sender_id) REFERENCES User (user_id) ON DELETE CASCADE,
    Foreign Key (recipient_id) REFERENCES User (user_id) ON DELETE CASCADE
);

-- Indexes for performance
CREATE INDEX idx_user_email ON User (email);

CREATE INDEX idx_property_location ON Property (location);

CREATE Table idx_booking_dates ON Booking (start_date, end_date);

CREATE INDEX idx_review_rating ON Review (rating);

CREATE INDEX idx_message_sent ON Message (sent_at);