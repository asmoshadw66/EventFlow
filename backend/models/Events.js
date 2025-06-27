const mongoose = require('mongoose');

const EventSchema = new mongoose.Schema({
  title: {
    type: String,
    required: [true, 'Title is required'],
    trim: true,
    maxlength: 100
  },
  description: {
    type: String,
    maxlength: 500
  },
  dateTime: {
    type: Date,
    required: [true, 'Event date/time is required'],
    validate: {
      validator: function(value) {
        return value > new Date(); 
      },
      message: 'Event date must be in the future'
    }
  },
  location: {
    type: String,
    required: [true, 'Location is required']
  },
  createdBy: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  },
  visibility: {
    type: String,
    enum: ['public', 'private'],
    default: 'public'
  }
}, { timestamps: true });

// Index for faster queries
EventSchema.index({ dateTime: 1, visibility: 1 });

module.exports = mongoose.model('Event', EventSchema);