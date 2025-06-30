# Airbnb Database Normalization

## 1NF (First Normal Form)
- All attributes are atomic.
- Multi-valued attributes like amenities are handled in separate tables (not shown in base model).
- Each record has a unique identifier (UUID).

## 2NF (Second Normal Form)
- All non-key attributes are fully functionally dependent on the whole primary key.
- Tables with composite keys like Message (`sender_id`, `recipient_id`) do not have partial dependencies.

## 3NF (Third Normal Form)
- No transitive dependencies:
  - Example: `User.email` is unique and only depends on `user_id`.
  - `Booking.total_price` is not derived from other columns, so it's stored directly.
- ENUM values and lookups like status and roles are not breaking normalization (since they are single-valued and not dependent on other non-key attributes).

## Conclusion
The schema follows 3NF:
- Atomic attributes ✅
- No partial dependencies ✅
- No transitive dependencies ✅

Normalization ensures efficient queries, reduces redundancy, and maintains data integrity.
