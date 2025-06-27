const express = require('express');
const Event = require('../models/Event');
const auth = require('../middleware/auth'); // Your JWT auth middleware
const router = express.Router();

// @route   POST /api/events
// @desc    Create new event
router.post('/', auth, async (req, res) => {
  try {
    const event = new Event({
      ...req.body,
      createdBy: req.user.id // From auth middleware
    });
    
    await event.save();
    res.status(201).json(event);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
});

module.exports = router;