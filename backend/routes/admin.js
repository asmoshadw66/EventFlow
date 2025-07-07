const express = require('express');
const router = express.Router();
const { protect, isAdmin } = require('../middleware/authMiddleware');
const {
  getAllUsers,
  getAllEvents,
  deleteUser,
  deleteEvent
} = require('../controllers/adminController');

router.get('/users', protect, isAdmin, getAllUsers);
router.get('/events', protect, isAdmin, getAllEvents);
router.delete('/user/:id', protect, isAdmin, deleteUser);
router.delete('/event/:id', protect, isAdmin, deleteEvent);

module.exports = router;