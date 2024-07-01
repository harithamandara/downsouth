import 'package:flutter/material.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'home_page.dart'; 
import 'place1.dart';
import 'notification.dart';
import 'user_page.dart';

void main() {
  runApp(Template());
}

class Template extends StatefulWidget {
  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Popular Destinations',
      theme: ThemeData(
        brightness: isDarkModeEnabled ? Brightness.dark : Brightness.light,
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Popular Destinations',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              icon: Icon(Icons.home),
            ),
          ],
        ),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ImageListScreen(isDarkModeEnabled: isDarkModeEnabled),
                ),
                Expanded(
                  child: ImageListScreen2(isDarkModeEnabled: isDarkModeEnabled),
                ),
                Section2(), 
              ],
            ),
            Positioned(
              top: 20,
              right: 20,
              child: DayNightSwitcher(
                isDarkModeEnabled: isDarkModeEnabled,
                onStateChanged: (isDarkModeEnabled) {
                  setState(() {
                    this.isDarkModeEnabled = isDarkModeEnabled;
                  });
                },
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: NavigationPanel(),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageListScreen extends StatelessWidget {
  final bool isDarkModeEnabled;

  ImageListScreen({required this.isDarkModeEnabled});

  final List<Map<String, dynamic>> imageData = [
    {
      'image': 'assets/images/galle1.jpg',
      'title': 'Galle Fort ',
      'rating': 5,
    },
    {
      'image': 'assets/images/jungle.jpg',
      'title': 'Jungle Beach Unawatuna',
      'rating': 3,
    },
    {
      'image': 'assets/images/turtlr.jpg',
      'title': 'Hikkaduwa Turtle Hatchery',
      'rating': 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: imageData.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            // Navigate to PlaceOne
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PlaceOne()),
            );
          },
          child: ImageCard(
            image: AssetImage(imageData[index]['image']),
            title: imageData[index]['title'],
            rating: imageData[index]['rating'],
            isDarkModeEnabled: isDarkModeEnabled,
          ),
        );
      },
    );
  }
}

class ImageListScreen2 extends StatelessWidget {
  final bool isDarkModeEnabled;

  ImageListScreen2({required this.isDarkModeEnabled});

  final List<Map<String, dynamic>> imageData2 = [
    {
      'image': 'assets/images/midigama.jpg',
      'title': 'Midigama Beach',
      'rating': 4,
    },
    {
      'image': 'assets/images/thalpe.jpg',
      'title': 'Thalpe Beach',
      'rating': 3,
    },
    {
      'image': 'assets/images/jp.png',
      'title': 'Japanese Peace Pagodda',
      'rating': 3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: imageData2.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            // Navigate to PlaceOne
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PlaceOne()),
            );
          },
          child: ImageCard(
            image: AssetImage(imageData2[index]['image']),
            title: imageData2[index]['title'],
            rating: imageData2[index]['rating'],
            isDarkModeEnabled: isDarkModeEnabled,
          ),
        );
      },
    );
  }
}

class ImageCard extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final int rating;
  final bool isDarkModeEnabled;

  ImageCard({
    required this.image,
    required this.title,
    required this.rating,
    required this.isDarkModeEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              image: image,
              width: 200,
              height: 220,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDarkModeEnabled ? Colors.white : Colors.black,
              ),
            ),
          ),
          Row(
            children: List.generate(
              rating,
              (index) => Icon(
                Icons.star,
                color: Colors.amber,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      // color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Places Near By',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.restaurant),
                    onPressed: () {
                      // Handle restaurant button press
                    },
                  ),
                  Text('Restaurant'),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.local_hospital),
                    onPressed: () {
                      // Handle hospital button press
                    },
                  ),
                  Text('Hospital'),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.shop),
                    onPressed: () {
                      // Handle hospital button press
                    },
                  ),
                  Text('Shps'),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.hotel),
                    onPressed: () {
                      
                    },
                  ),
                  Text('Hotel'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NavigationPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.grey.withOpacity(0.7),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              // Navigate to HomePage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            icon: Icon(Icons.home),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              // Handle navigation to Search
            },
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
          GestureDetector(
            onTap: () {
              // Navigate to NotificationPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            },
            child: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              // Navigate to UserAccountPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserAccountPage()),
              );
            },
            icon: Icon(Icons.account_circle),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
