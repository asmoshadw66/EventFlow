const mongoose = require('mongoose');

const GoalSchema = new mongoose.Schema({
  userId: { 
    type: mongoose.Schema.Types.ObjectId, 
    ref: 'User', 
    required: true 
  },
  targetHoursPerWeek: {
    type: Number,
    required: true,
    min: 1,
    max: 168 
  },
  startDate: { 
    type: Date, 
    required: true,
    default: Date.now 
  },
  endDate: { 
    type: Date,
    validate: {
      validator: function(value) {
        return value > this.startDate;
      },
      message: 'End date must be after '
    }
  },
  progress: { 
    type: Number, 
    default: 0,
    min: 0,
    max: 100 
  }
}, { timestamps: true });

module.exports = mongoose.model('Goal', GoalSchema);