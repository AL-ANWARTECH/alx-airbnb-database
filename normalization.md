# Database Normalization Report (Airbnb Clone)

## Objective
To ensure our Airbnb-like database schema is normalized to **Third Normal Form (3NF)** in order to eliminate redundancy and improve data integrity.

---

## Step 1: First Normal Form (1NF)

- All attributes contain atomic values (e.g., no multiple emails or lists in a single column).
- No repeating groups or arrays.
- ✅ **All tables satisfy 1NF.**

---

## Step 2: Second Normal Form (2NF)

- Each table has a single-column primary key.
- All non-key attributes are fully functionally dependent on the whole primary key.
- ✅ **All tables satisfy 2NF.**

---

## Step 3: Third Normal Form (3NF)

### Observations:
- `Review` table had duplicate `user_id` — **Removed the duplicate.**
- `Message` table had duplicate `recipient_id` — **Removed the duplicate.**

### Result:
- No transitive dependencies remain.
- All attributes are dependent only on the primary key.

✅ **All tables now satisfy 3NF.**

---

## Final Schema Summary (3NF-compliant)

- **User(user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)**
- **Property(property_id, host_id, name, description, location, price_per_night, created_at, updated_at)**
- **Booking(booking_id, user_id, start_date, end_date, total_price, status, created_at)**
- **Payment(payment_id, booking_id, amount, payment_date, payment_method)**
- **Review(review_id, property_id, user_id, rating, comment, created_at)**
- **Message(message_id, sender_id, recipient_id, message_body, sent_at)**

---

## Conclusion

The schema has been successfully normalized up to 3NF. Redundant attributes were removed and all tables maintain data integrity without unnecessary duplication.
