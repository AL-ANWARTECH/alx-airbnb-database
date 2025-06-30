# Airbnb Database Schema

This SQL script defines the relational schema for an Airbnb-like system. It includes:

## Tables
- `User`: Stores platform users (guests, hosts, admins)
- `Property`: Listings created by hosts
- `Booking`: Reservations made by guests
- `Payment`: Payments linked to bookings
- `Review`: Ratings and comments by guests
- `Message`: Messaging between users

## Constraints
- UUIDs used as primary keys
- ENUM-type constraints enforced via CHECK
- Foreign keys defined with ON DELETE CASCADE
- Indexes included for better query performance