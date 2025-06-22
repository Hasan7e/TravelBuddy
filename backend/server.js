require('dotenv').config(); // load .env variables
const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const bookingsRoute = require('./routes/bookings');



const app = express();

app.use(cors());
app.use(express.json());

mongoose.connect(process.env.MONGODB_URI, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
})

.then(() => console.log('MongoDB connected'))
.catch((err) => console.error('MongoDB connection error:', err));

// 👇 Add this route
app.use('/api/bookings', bookingsRoute);

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
