const mongoose = require('mongoose');

const StudyTaskSchema = new mongoose.Schema({
  userId: { 
    type: mongoose.Schema.Types.ObjectId, 
    ref: 'User', 
    required: true 
  },
  title: {
    type: String,
    required: [true, 'Title is required'],
    maxlength: 100
  },
  description: {
    type: String,
    maxlength: 500
  },
  date: { 
    type: Date, 
    required: true,
    default: Date.now 
  },
  duration: { // in minutes
    type: Number,
    min: 5,
    max: 1440 // 24 hours
  },
  completed: { 
    type: Boolean, 
    default: false 
  }
}, { timestamps: true });

module.exports = mongoose.model('StudyTask', StudyTaskSchema);