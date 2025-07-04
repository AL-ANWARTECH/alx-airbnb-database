-- Partitioning the Booking table by start_date (monthly)

-- 1. Rename the original table for backup
ALTER TABLE Booking RENAME TO Booking_backup;

-- 2. Create a new partitioned Booking table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2),
    status VARCHAR(10),
    created_at TIMESTAMP DEFAULT NOW()
)
PARTITION BY
    RANGE (start_date);

-- 3. Create child partitions for specific date ranges
CREATE TABLE Booking_2024_01 PARTITION OF Booking FOR
VALUES
FROM ('2024-01-01') TO ('2024-02-01');

CREATE TABLE Booking_2024_02 PARTITION OF Booking FOR
VALUES
FROM ('2024-02-01') TO ('2024-03-01');

CREATE TABLE Booking_2024_03 PARTITION OF Booking FOR
VALUES
FROM ('2024-03-01') TO ('2024-04-01');

-- (Add more as needed, or automate with a script)

-- 4. Optional: Insert data from backup into partitioned table
INSERT INTO Booking SELECT * FROM Booking_backup;