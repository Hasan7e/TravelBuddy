import 'package:flutter/material.dart';
import 'package:travelbuddy/pages/barcelona.dart';
import 'package:travelbuddy/pages/chatbot.dart';
import 'package:travelbuddy/pages/eiffel_tower.dart';
import 'package:travelbuddy/pages/great_wall.dart';
import 'package:travelbuddy/pages/rome.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; //import for apikey

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // important!
  await dotenv.load(fileName: ".env"); // loading environment variables
  runApp(TravelBuddyApp());
}

class TravelBuddyApp extends StatelessWidget {
  const TravelBuddyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TravelBuddy',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
      routes: {
        '/chatbot':
            (context) => const ChatBotPage(), //routes to the AI chatbot Page
        '/eiffel': (context) => const EiffelTowerPage(), //route to Eiffel Tower

        '/barcelona':
            (context) => const BarcelonaPage(), //route to Barcelona Page

        '/rome': (context) => const RomePage(), // route to rome page

        '/wall': (context) => const GreatWallPage(), // route to wall page
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "TravelBuddy",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text("Home", style: TextStyle(fontSize: 16)),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(context),
            _buildHorizontalOptions(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Top Destinations",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            _buildFeaturedPlaces(context),
            //_buildAIChat(),
          ],
        ),
      ),
    );
  }
}

// searchbar with AI chatbot icon beside it
Widget _buildSearchBar(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                "Search Destination",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            GestureDetector(
              onTap: () {
                // we can trigger chatbot functionality or navigation here
                print("AI Chatbot tapped");
                Navigator.pushNamed(
                  context,
                  '/chatbot',
                ); // Navigate to Chatbot page
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.chat_bubble_outline,
                      size: 20,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 4),
                    Text("AI Chat", style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: "Where to?",
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    ),
  );
}

Widget _buildHorizontalOptions() {
  final options = ['Flight', 'Train', 'Hotel', 'Food', 'Activities'];
  final icons = [
    Icons.flight,
    Icons.train,
    Icons.hotel,
    Icons.restaurant,
    Icons.hiking,
  ];

  return SizedBox(
    height: 100,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: options.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              CircleAvatar(radius: 28, child: Icon(icons[index], size: 28)),
              const SizedBox(height: 6),
              Text(options[index]),
            ],
          ),
        );
      },
    ),
  );
}

Widget _buildFeaturedPlaces(BuildContext context) {
  final places = [
    {'name': 'Eiffel Tower', 'image': 'assets/images/eiffel.png'},
    {'name': 'Barcelona', 'image': 'assets/images/barcelona.png'},
    {'name': 'Rome', 'image': 'assets/images/rome.png'},
    {'name': 'Great Wall', 'image': 'assets/images/great_wall.png'},
  ];

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemCount: places.length,
      itemBuilder: (ctx, index) {
        return GestureDetector(
          onTap: () {
            String placeName = places[index]['name']!;
            if (placeName == 'Eiffel Tower') {
              Navigator.pushNamed(context, '/eiffel');
            } else if (placeName == 'Barcelona') {
              // code for Barcelona page
              Navigator.pushNamed(context, '/barcelona');
            } else if (placeName == 'Rome') {
              //go to rome page
              Navigator.pushNamed(context, '/rome');
            } else if (placeName == 'Great Wall') {
              //go to great wall page
              Navigator.pushNamed(context, '/wall');
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.asset(
                      places[index]['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    places[index]['name']!,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

//AI chat bot integration
