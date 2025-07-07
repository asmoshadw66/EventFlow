const sendInvitationEmail = require('../utils/mailer');
const User = require('../models/User');

exports.createEvent = async (req, res) => {
  const { title, description, dateTime, location, visibility, invitees } = req.body;
  try {
    const event = await Event.create({
      title, description, dateTime, location, visibility,
      createdBy: req.user._id
    });


    for (const email of invitees) {
      await sendInvitationEmail(
        email,
        `Invitation: ${title}`,
        `Vous êtes invité(e) à ${title} le ${new Date(dateTime).toLocaleString()}\nLieu: ${location}\n\nRépondez via l'application.`
      );
    }

    res.status(201).json(event);
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};
