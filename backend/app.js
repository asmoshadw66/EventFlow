const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const eventRoutes = require('./routes/events');

const app = express();
app.use(cors());
app.use(express.json());

// Connexion MongoDB
mongoose.connect('mongodb://localhost:27017/eventmate')
  .then(() => console.log('Connecté à MongoDB'))
  .catch(err => console.error(err));

// Routes
app.use('/api/events', eventRoutes);

app.listen(5000, () => console.log('Serveur démarré sur le port 5000'));