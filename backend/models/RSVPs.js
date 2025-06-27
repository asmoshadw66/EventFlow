const mongoose = require('mongoose');

const RSVPSchema = new mongoose.Schema({
  eventId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Event',
    required: true
  },
  userId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  },
  response: {
    type: String,
    enum: ['yes', 'no', 'maybe'],
    required: true
  },
  comment: {
    type: String,
    maxlength: 200
  }
}, { timestamps: true });

RSVPSchema.index({ eventId: 1, userId: 1 }, { unique: true });

module.exports = mongoose.model('RSVP', RSVPSchema);