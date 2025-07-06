const RSVP = require('../models/RSVPs');

exports.submitRSVP = async (req, res) => {
  const { response, comment } = req.body;
  const { eventId } = req.params;
  const userId = req.user.id;

  try {
    const existing = await RSVP.findOne({ eventId, userId });

    if (existing) {
      existing.response = response;
      existing.comment = comment;
      await existing.save();
      return res.json({ message: 'RSVP updated' });
    }

    await RSVP.create({ eventId, userId, response, comment });
    res.status(201).json({ message: 'RSVP saved' });
  } catch (err) {
    res.status(500).json({ error: 'Server error' });
  }
};

exports.getEventRSVPs = async (req, res) => {
  try {
    const rsvps = await RSVP.find({ eventId: req.params.eventId })
      .populate('userId', 'name email');
    res.json(rsvps);
  } catch (err) {
    res.status(500).json({ error: 'Failed to fetch RSVPs' });
  }
};
