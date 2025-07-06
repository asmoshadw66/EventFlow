const Event = require('../models/Events');



exports.createEvent = async (req, res) => {
  try {
    const event = await Event.create({
      ...req.body,
      createdBy: req.user._id
    });

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
};

/*exports.getEvents = async (req, res) => {
  try {
    const events = await Event.find({ createdBy: req.user._id });
    res.status(200).json({
      success: true,
      data: events
    });
  } catch (err) {
    res.status(400).json({
      success: false,
      error: err.message
    });
  }
};
*/