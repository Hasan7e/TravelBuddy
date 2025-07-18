// Add this to routes/hotelBookings.js
const express = require('express');
const router = express.Router();
const HotelBooking = require('../models/HotelBooking');

router.post('/', async (req, res) => {
  try {
    const newBooking = new HotelBooking(req.body);
    await newBooking.save();
    res.status(200).json({ message: 'Booking successful' });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

module.exports = router;
