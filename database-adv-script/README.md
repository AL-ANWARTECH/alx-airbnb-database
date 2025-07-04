# Advanced SQL Joins – Airbnb Database

This file demonstrates mastering SQL joins using the Airbnb relational schema.

## Queries Included

1. **INNER JOIN**
   - Retrieve all bookings and the corresponding users who made them.

2. **LEFT JOIN**
   - Retrieve all properties and their reviews.
   - Properties with no reviews are also included.

3. **FULL OUTER JOIN**
   - Retrieve all users and all bookings.
   - Users without bookings and bookings not linked to any user are both included.
   - Since MySQL does not support FULL OUTER JOIN directly, we use a `UNION` of `LEFT JOIN` and `RIGHT JOIN`

# Subqueries – Airbnb Database

This file demonstrates SQL subquery techniques using the Airbnb database schema.

## Queries Included

### 1. Non-Correlated Subquery
**Goal**: Retrieve all properties where the average review rating is greater than 4.0.

```sql
SELECT *
FROM Property
WHERE property_id IN (
    SELECT property_id
    FROM Review
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

# SQL Aggregations & Window Functions – Airbnb Database

This script demonstrates the use of **aggregations** and **window functions** for data analysis in an Airbnb-like relational database.

---

## 📁 Files

- `aggregations_and_window_functions.sql`: SQL queries for grouped analysis and property ranking.

---

## 📊 Queries Included

### 1. Aggregation – Total Bookings Per User

**Goal**: Count how many bookings each user has made.

```sql
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM
    User u
LEFT JOIN
    Booking b ON u.user_id = b.user_id
GROUP BY
    u.user_id, u.first_name, u.last_name
ORDER BY
    total_bookings DESC;
