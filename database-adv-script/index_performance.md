# Index Performance Analysis – Airbnb Database

This document shows how adding indexes to high-usage columns improves query performance.

---

## 🔍 Identified High-Usage Columns

| Table     | Column(s)             | Usage Context                            |
|-----------|-----------------------|------------------------------------------|
| User      | `email`               | WHERE clause in login, validations       |
| User      | `role`                | Filtering admin/host/guest               |
| Property  | `location`, `host_id` | WHERE filters and JOINs with User        |
| Booking   | `user_id`, `property_id` | JOINs, analytics, filters              |
| Booking   | `start_date`, `end_date` | Availability filtering                 |

---

## 🛠️ Indexes Created

```sql
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_role ON User(role);

CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_host_id ON Property(host_id);

CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);
