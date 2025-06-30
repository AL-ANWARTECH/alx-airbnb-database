-- Users
INSERT INTO
    User (
        user_id,
        first_name,
        last_name,
        email,
        password_hash,
        phone_number,
        role,
        created_at
    )
VALUES (
        '00000000-0000-0000-0000-000000000001',
        'Alice',
        'Johnson',
        'alice@example.com',
        'hash123',
        '1234567890',
        'guest',
        CURRENT_TIMESTAMP
    ),
    (
        '00000000-0000-0000-0000-000000000002',
        'Bob',
        'Smith',
        'bob@example.com',
        'hash456',
        NULL,
        'host',
        CURRENT_TIMESTAMP
    ),
    (
        '00000000-0000-0000-0000-000000000003',
        'Charlie',
        'Lee',
        'charlie@example.com',
        'hash789',
        '0987654321',
        'admin',
        CURRENT_TIMESTAMP
    );

-- Properties
INSERT INTO
    Property (
        property_id,
        host_id,
        name,
        description,
        location,
        pricepernight,
        created_at,
        updated_at
    )
VALUES (
        '10000000-0000-0000-0000-000000000001',
        '00000000-0000-0000-0000-000000000002',
        'Cozy Apartment',
        'A nice and cozy apartment in downtown.',
        'Lagos',
        75.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        '10000000-0000-0000-0000-000000000002',
        '00000000-0000-0000-0000-000000000002',
        'Beach House',
        'Beautiful house near the beach.',
        'Port Harcourt',
        150.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    );

-- Bookings
INSERT INTO
    Booking (
        booking,
        property_id,
        user_id,
        start_date,
        end_date,
        total_price,
        status,
        created_at
    )
VALUES (
        '20000000-0000-0000-0000-000000000001',
        '10000000-0000-0000-0000-000000000001',
        '00000000-0000-0000-0000-000000000001',
        '2025-07-01',
        '2025-07-05',
        300.00,
        'confirmed',
        CURRENT_TIMESTAMP
    ),
    (
        '20000000-0000-0000-0000-000000000002',
        '10000000-0000-0000-0000-000000000002',
        '00000000-0000-0000-0000-000000000001',
        '2025-08-10',
        '2025-08-12',
        300.00,
        'pending',
        CURRENT_TIMESTAMP
    );

-- Payments
INSERT INTO
    Payment (
        payment_id,
        booking_id,
        amount,
        payment_date,
        payment_method
    )
VALUES (
        '30000000-0000-0000-0000-000000000001',
        '20000000-0000-0000-0000-000000000001',
        300.00,
        CURRENT_TIMESTAMP,
        'credit_card'
    );

-- Reviews
INSERT INTO
    Message (
        review_id,
        property_id,
        user_id,
        rating,
        comment,
        created_at
    )
VALUES (
        '40000000-0000-0000-0000-000000000001',
        '10000000-0000-0000-0000-000000000001',
        '00000000-0000-0000-0000-000000000001',
        5,
        'Wonderful stay! Very clean and quiet.',
        CURRENT_TIMESTAMP
    ),
    (
        '40000000-0000-0000-0000-000000000002',
        '10000000-0000-0000-0000-000000000002',
        '00000000-0000-0000-0000-000000000001',
        4,
        'Nice place but a bit noisy.',
        CURRENT_TIMESTAMP
    );

-- Messages
INSERT INTO
    Message (
        message_id,
        sender_id,
        recipient_id,
        message_body,
        sent_at
    )
VALUES (
        '50000000-0000-0000-0000-000000000001',
        '00000000-0000-0000-0000-000000000001',
        '00000000-0000-0000-0000-000000000002',
        'Hello Bob, is the apartment available on July 1st?',
        CURRENT_TIMESTAMP
    ),
    (
        '50000000-0000-0000-0000-000000000002',
        '00000000-0000-0000-0000-000000000002',
        '00000000-0000-0000-0000-000000000001',
        'Hi Alice, yes it is available. Feel free to book.',
        CURRENT_TIMESTAMP
    );