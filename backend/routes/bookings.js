const express = require('express');
const router = express.Router();
const Booking = require('../models/Booking');

// POST /bookings - create new booking
router.post('/', async (req, res) => {
  try {
    const booking = new Booking(req.body);
    await booking.save();
    res.status(201).json({ message: 'Flight booked successfully' });
  } catch (err) {
    console.error('Error saving booking:', err);
    res.status(400).json({ message: 'Failed to save booking', error: err.message });
  }
});

// GET /bookings - list all bookings (optional for view)
router.get('/', async (req, res) => {
  try {
    const bookings = await Booking.find();
    res.json(bookings);
  } catch (err) {
    res.status(500).json({ message: 'Failed to fetch bookings' });
  }
});

module.exports = router;
