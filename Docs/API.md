# 📘 Event RSVP Manager – API Endpoints

This document describes all REST API endpoints used for user management, event handling, RSVP responses, and admin controls.

---

## 🔐 Authentication

| Method | Endpoint        | Description                      | Auth Required |
|--------|------------------|----------------------------------|----------------|
| POST   | `/api/register` | Register a new user              | ❌             |
| POST   | `/api/login`    | Login and retrieve JWT token     | ❌             |

---

## 👤 Users

| Method | Endpoint       | Description                      | Auth Required |
|--------|----------------|----------------------------------|----------------|
| GET    | `/api/users/me`| Get current user profile         | ✅             |

---

## 📅 Events

| Method | Endpoint             | Description                              | Auth Required |
|--------|----------------------|------------------------------------------|----------------|
| POST   | `/api/events`        | Create a new event                       | ✅             |
| GET    | `/api/events/public` | Get all public events                    | ❌             |
| GET    | `/api/events/:id`    | Get event details by ID                  | ✅             |
| DELETE | `/api/events/:id`    | Delete event (by host or admin)          | ✅             |

---

## ✅ RSVP

| Method | Endpoint                | Description                              | Auth Required |
|--------|-------------------------|------------------------------------------|----------------|
| POST   | `/api/rsvp/:eventId`    | Submit RSVP (yes/no/maybe) for an event  | ✅             |
| GET    | `/api/rsvp/event/:id`   | Get all RSVPs for a specific event       | ✅             |

---

## 🛠 Admin (Requires Admin Role)

| Method | Endpoint                | Description                   | Auth Required |
|--------|-------------------------|-------------------------------|----------------|
| GET    | `/api/admin/users`      | View all registered users     | ✅ (admin only)|
| GET    | `/api/admin/events`     | View all events               | ✅ (admin only)|
| DELETE | `/api/admin/user/:id`   | Delete a specific user        | ✅ (admin only)|
| DELETE | `/api/admin/event/:id`  | Delete a specific event       | ✅ (admin only)|

---

## 📧 Notifications (Optional)

| Method | Endpoint                | Description                       | Auth Required |
|--------|-------------------------|-----------------------------------|----------------|
| POST   | `/api/notify/invite`    | Send invitation email notification| ✅             |

---

## 🔐 JWT Authentication

Endpoints marked with ✅ require a valid JWT token in the request header:

