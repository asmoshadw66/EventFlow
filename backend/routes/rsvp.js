const express = require('express');
const RSVP = require('../models/RSVPs');
const Event = require('../models/Events');
const auth = require('../middleware/authMiddleware');
const router = express.Router();


const { respondToEvent, getEventResponses } = require('../controllers/rsvpController');
const protect = require('../middleware/authMiddleware');

router.post('/respond', protect, respondToEvent);
router.get('/event/:id', protect, getEventResponses);

module.exports = router;
