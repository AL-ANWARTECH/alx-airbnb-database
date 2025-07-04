# Performance Monitoring & Refinement – Airbnb Database

This report demonstrates how to continuously monitor and refine the performance of frequently used SQL queries in the Airbnb relational database.

---

## 🎯 Objective

- Monitor performance using `EXPLAIN ANALYZE` (PostgreSQL) or `SHOW PROFILE` (MySQL).
- Identify inefficient operations (e.g., full table scans, nested loops).
- Apply schema adjustments or indexing to eliminate bottlenecks.

---

## 📌 Tooling Used

| Tool               | Purpose                                      |
|--------------------|----------------------------------------------|
| `EXPLAIN`          | Show query execution plan                   |
| `EXPLAIN ANALYZE`  | Show actual runtime details (PostgreSQL)    |
| `SHOW PROFILE`     | Detailed profiling (MySQL only)             |

---

## 🔍 Step 1: Monitor Query Performance

### Example 1: Get bookings for a specific user

```sql
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE user_id = 'uuid-123';
