const express = require('express');
const router = express.Router();
const { protect } = require('../middleware/authMiddleware');
const { submitRSVP, getEventRSVPs } = require('../controllers/rsvpController');
const RSVPs = require('../models/RSVPs');


router.post('/:eventId', protect, submitRSVP);

router.get('/event/:eventId', protect, getEventRSVPs);

router.get('/all', async (req, res) => {
  const users = await RSVPs.find();
  res.json(users);
});

module.exports = router;
