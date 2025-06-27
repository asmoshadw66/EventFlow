const express = require('express');
const RSVP = require('../models/RSVP');
const Event = require('../models/Event');
const auth = require('../middleware/auth');
const router = express.Router();

// @route   PUT /api/events/:eventId/rsvp
// @desc    Submit RSVP
router.put('/:eventId/rsvp', auth, async (req, res) => {
  try {
    // Check if event exists
    const event = await Event.findById(req.params.eventId);
    if (!event) return res.status(404).json({ error: 'Event not found' });

    // Create/update RSVP
    const rsvp = await RSVP.findOneAndUpdate(
      { eventId: req.params.eventId, userId: req.user.id },
      { response: req.body.response, comment: req.body.comment },
      { new: true, upsert: true } // Create if doesn't exist
    );

    res.json(rsvp);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
});

module.exports = router;