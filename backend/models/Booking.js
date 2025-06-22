const mongoose = require('mongoose');

const bookingSchema = new mongoose.Schema({
  name: { type: String, required: true },
  email: { type: String, required: true },
  dateOfBirth: { type: String, required: true },
  airport: { type: String, required: true },
  departureDate: { type: String, required: true },
  returnDate: { type: String, required: true },
}, { timestamps: true });

module.exports = mongoose.model('Booking', bookingSchema);
