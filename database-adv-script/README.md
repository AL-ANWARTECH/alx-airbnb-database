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