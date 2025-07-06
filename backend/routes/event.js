const express = require('express');
const Event = require('../models/Events');
const { protect } = require('../middleware/authMiddleware');
const Events = require('../models/Events');

const router = express.Router();


router.post('/', protect, async (req, res) => {
  try {
    const event = new Event({
      ...req.body,
      createdBy: req.user._id 
    });
    
    await event.save();
    
    res.status(201).json({
      success: true,
      data: event
    });
  } catch (err) {
    res.status(400).json({
      success: false,
      error: err.message
    });
  }
});
router.get('/all', async (req, res) => {
  const users = await Events.find();
  res.json(users);
});

module.exports = router;
