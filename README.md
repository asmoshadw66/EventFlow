# 📅 EventFlow

## 📘 Context

This project integrates two learning modules:

- **Mobile Development**: Create a Flutter app that allows users to manage and respond to event invitations.
- **Web Services with REST API Development**: Use Node.js, Express, and MongoDB to power the backend for events, users, and RSVP data.

The application simulates real-life use cases for managing personal or corporate events and social gatherings, enabling invitation handling and attendee tracking.

---

## 📝 Project Description

The Event RSVP Manager enables:

- Users to create events and invite other users
- Guests to accept, reject, or comment on invitations
- Hosts to track responses and manage attendance
- Admins to monitor event trends and user activity (optional)

**Optional Features**:

- Calendar synchronization
- QR-code-based check-in for physical events

---

## ✅ Functional Requirements

### 👥 Users

- Register/login and view event invitations
- Create events with title, location, and time
- Invite others via email or username
- RSVP to invitations (accept / decline / maybe)

### 🔧 Admins (Optional)

- View all public events
- Remove reported events or users

---

## 🛠 Technical Requirements

### 🔙 Backend (Node.js + Express + MongoDB)

- REST API for events, invitations, and responses
- JWT-based authentication and authorization
- Support for public/private event visibility
- Optional: Email notification integration

### 📱 Mobile App (Flutter)

- User interface for event creation and RSVP
- Invitations inbox and response screen
- Event detail view with response summary
- Optional: Calendar or timeline view

---

## 🧬 Sample Database Schema

### Users

```json
{
"name": "string",
"email": "string",
"password": "hashed"
}
```

### EStudyTasks

```json
{
"userId": "ref to Users",
"title": "string",
"description": "string",
"date": "ISODate",
"duration": "number (in minutes)",
"completed": "boolean"
}
```

### Goals

```json
{
"userId": "ref to Users",
"targetHoursPerWeek": "number",
"startDate": "ISODate",
"endDate": "ISODate"
}
```

---

## 📊 Evaluation Criteria

| Criteria              | Description                                                     |
| --------------------- | --------------------------------------------------------------- |
| **Functionality**     | Invitation system with RSVP and event management works smoothly |
| **Code Quality**      | Clear modular structure and separation of concerns              |
| **UI/UX**             | Mobile interface is engaging and intuitive                      |
| **API Design**        | Proper REST conventions, versioning, and security               |
| **Calendar Handling** | Correct handling of date/time and invitations                   |
| **Documentation**     | Complete with setup, user guide, and team contributions         |

---

## 📦 Deliverables

1. **Mobile App (Flutter)**

   * APK and full source code
   * Screenshots of invitation and RSVP flows

2. **Backend (Node.js/Express/MongoDB)**

   * REST API with CRUD and role handling
   * API documentation and sample requests

3. **Database**

   * Schema documentation and seed data

4. **Documentation**

   * `README.md`, usage guide, and team contributions

5. **Presentation**

   * Walkthrough of RSVP workflow
   * Presentation deck highlighting features

---



