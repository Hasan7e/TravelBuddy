# travelbuddy

A Flutter project.

TravelBuddy is a smart travel companion app built using **Flutter**, designed to help users explore, plan, and book travel destinations with ease. It features integrated AI support, destination highlights, flight and hotel bookingforms, and user authentication.

---

## Getting Started
### Prerequisites
- **Flutter SDK**
- **Dart**
- **Firebase Project**
- **IDE**

### Installation
1. **Clone the repository**:
    ```bash
    git clone https://github.com/Hasan7e/TravelBuddy
    cd travelbuddy
2. **Install Flutter dependencies**
    Flutter pub get
3. **Create .env file **
    API_KEY=your_google_api_key
MONGODB_URI=your_mongo_connection_string
4. **Run Backend **
    Cd backend
    Node server.js
5. **choose your simulator**
    Ios/android simulator
6. **Run frontend **
    Cd frontend
    Flutter run 



### Configure environment
1. **update .env file in project root with API keys**
2. **run the app using your chosen simulator**
3. **if android emulator use 'http:http://10.0.2.2:3000/api/bookings' to connect to mongodb**
4. **if using ios simulator use 'http://localhost:3000/api/bookings' to connect to mongodb.**

---

## ✨ Features

- 🏠 **Home Page** with popular travel destinations and AI assistant
- 🔍 **Search Functionality** for finding destinations
- ✈️ **Flight Booking** form with MongoDB integration
- 🏨 **Hotel Booking** form with check-in/out date pickers
- 💬 **AI Travel Assistant** using Google AI for travel queries
- 🔐 **User Authentication** with login, logout, and session handling
- 📱 Responsive UI built with Flutter

---

## 🛠️ Technologies Used

- **Flutter** & Dart
- **Firebase Authentication**
- **MongoDB** (via backend API)
- **Express.js (Node.js)** for backend routing
- **Google AI / Gemini API** for chat assistant
- **Flutter Dotenv** for environment variable management

---

