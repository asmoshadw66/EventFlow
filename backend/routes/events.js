const express = require('express');
const Event = require('../models/Event');
const router = express.Router();

// Récupérer tous les événements
router.get('/', async (req, res) => {
  try {
    const events = await Event.find();
    res.json(events);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

// Créer un événement
router.post('/', async (req, res) => {
  const event = new Event({
    title: req.body.title,
    location: req.body.location,
    date: req.body.date
  });

  try {
    const newEvent = await event.save();
    res.status(201).json(newEvent);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});