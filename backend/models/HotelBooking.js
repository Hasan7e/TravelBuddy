const mongoose = require('mongoose');

const hotelBookingSchema = new mongoose.Schema({
  name: String,
  email: String,
  dob: String,
  check_in: String,
  check_out: String,
  hotel: String,
});

module.exports = mongoose.model('HotelBooking', hotelBookingSchema);
