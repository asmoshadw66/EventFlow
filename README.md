# EventFlow Documentation

---

## 📘 Project Overview

This is a complete solution for managing events and RSVPs:

- **Mobile App (Flutter)**: Create, receive, and respond to invitations
- **Backend (Node.js + Express + MongoDB)**: REST API with user authentication, event handling, and RSVP functionality
- **Notifications**: Automatic email confirmation for RSVP responses

## 🔗 GitHub Repository

[Event RSVP Manager Repo](https://github.com/asmoshadw66/EventFlow.git)

## 🛠 Setup Instructions

### Backend Setup

```bash
git https://github.com/asmoshadw66/EventFlow.git
cd Event_RSVP_Manager/backend
npm install
```

Create a `.env` file:

```env
MONGO_URI=your_mongodb_uri
JWT_SECRET=your_jwt_secret
EMAIL_USER=your_email@gmail.com
EMAIL_PASS=your_email_password
PORT=5000
```

Start backend server:

```bash
npm run dev
```

### Flutter Mobile App

```bash
cd ../mobile_app
flutter pub get
flutter run
```

Update `lib/config.dart`:

```dart
const String apiBaseUrl = 'http://10.0.2.2:5000';
```

## 📂 Directory Structure

```
/Event_RSVP_Manager
├── backend/
│   ├── controllers/
│   ├── middleware/
│   ├── models/
│   ├── routes/
│   ├── utils/
│   └── server.js
├── mobile_app/
│   └── lib/
└── docs/
    ├── API.md
    └── README.md
```

## 📥 API Endpoints

### Users
- `POST /api/users/register` → Register new user
- `POST /api/users/login` → Authenticate and receive JWT
- `GET /api/users/profile` → Get current user profile

### Events
- `POST /api/events` → Create event (auth required)
- `GET /api/events/all` → List all events
- `GET /api/events/:id` → Get specific event
- `PUT /api/events/:id` → Update event
- `DELETE /api/events/:id` → Delete event

### RSVP
- `POST /api/rsvp/respond` → Submit RSVP response (auth required)
- `GET /api/rsvp/event/:id` → Get RSVP responses by event ID

## 💌 Email Notification

When a user RSVPs, an email is sent automatically using Nodemailer.

**File:** `backend/utils/mailer.js`

```js
const nodemailer = require('nodemailer');

const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: process.env.EMAIL_USER,
    pass: process.env.EMAIL_PASS
  }
});

exports.sendRSVPNotification = (email, eventTitle) => {
  const mailOptions = {
    from: process.env.EMAIL_USER,
    to: email,
    subject: `RSVP Confirmation - ${eventTitle}`,
    text: `Thank you for responding to the event: ${eventTitle}`
  };

  transporter.sendMail(mailOptions);
};
```

## 📱 Mobile App Features

- **User Authentication**: Register and log in
- **Dashboard**: View all invited events
- **Create Events**: Set title, location, date/time, visibility
- **RSVP**: Respond to events with yes, no, maybe, and optional comment
- **Details View**: See all event info and RSVP status

> Optional features such as calendar sync and QR code check-ins can be added with Flutter plugins.

## 🧪 Testing

- Use **Postman** 
- Flutter app have been tested on emulators

## 🔐 Notes

- Protect your `.env` file — do not commit secrets
- Use environment variables to store your sensitive data
- Use version control (Git) for team collaboration

---

