require('dotenv').config();
const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const adminRoutes = require('./routes/admin');


const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
// Middleware
app.use('/api/users', require('./routes/user'));
app.use('/api/events', require('./routes/event'));
app.use('/api/rsvp', require('./routes/rsvp'));
app.use('/api/admin', adminRoutes);

// MongoDB Connection
mongoose.connect(process.env.MONGODB_URI)
  .then(() => console.log('Connected to MongoDB'))
  .catch(err => console.error('MongoDB connection error:', err));

// Test Route
app.get('/', (req, res) => {
  res.send('EventFlow Backend is Running!');
});


// After middleware setup
app.use('/api/events', require('./routes/event'));
app.use('/api/events', require('./routes/rsvp'));


app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Headers', 'Authorization, Content-Type');
  next();
});

// Start Server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}, click on http://localhost:5000`);
});


