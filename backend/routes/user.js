const express = require('express');
const router = express.Router();
const { registerUser, loginUser } = require('../controllers/userController');
const User = require('../models/User');

router.post('/register', registerUser);

router.post('/login', loginUser);

router.get('/all', async (req, res) => {
  const users = await User.find();
  res.json(users);
});

module.exports = router;
