# Booking Table Partitioning Performance Report

## 🎯 Objective

Optimize performance for queries on the large `Booking` table by implementing **partitioning** based on the `start_date` column.

---

## ⚙️ Implementation Overview

- Partitioned the `Booking` table by month using `RANGE` partitioning.
- Created sub-tables: `Booking_2024_01`, `Booking_2024_02`, etc.
- Populated the new partitioned table using data from the backup.

---

## 🔍 Query Used for Testing

```sql
SELECT *
FROM Booking
WHERE start_date BETWEEN '2024-02-01' AND '2024-02-28';
