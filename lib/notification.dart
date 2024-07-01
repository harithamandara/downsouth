import 'package:flutter/material.dart';
import 'user_page.dart';
import 'home_page.dart';

void main() {
  runApp(NotificationApp());
}

class NotificationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notification App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: NotificationPage(),
    );
  }
}

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NotificationItem(
              user: 'Derik',
              message: 'New tour package available for Koggala Beach',
              date: 'Jan 18',
              time: '8:30 AM',
              imagePath: 'assets/images/tourist.jpg',
            ),
            SizedBox(height: 10),
            NotificationItem(
              user: 'Derik',
              message: 'Special discount for Yala National Park safari',
              date: 'Jan 18',
              time: '10:45 AM',
              imagePath: 'assets/images/yala.jpg',
            ),
            SizedBox(height: 10),
            NotificationItem(
              user: 'Derik',
              message: 'Reminder: Visit Galle Fort today!',
              date: 'Jan 18',
              time: '1:20 PM',
              imagePath: 'assets/images/fort2.jpg',
            ),
            SizedBox(height: 10),
            NotificationItem(
              user: 'Derik',
              message: 'Explore Mirissa Beach this weekend!',
              date: 'Jan 18',
              time: '3:55 PM',
              imagePath: 'assets/images/midigama.jpg',
            ),
            SizedBox(height: 10),
            NotificationItem(
              user: 'Derik',
              message: 'New blog post: Top 10 attractions in Ella',
              date: 'Jan 18',
              time: '6:10 PM',
              imagePath: 'assets/images/ella.jpg',
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationPanel(),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String user;
  final String message;
  final String date;
  final String time;
  final String imagePath;

  NotificationItem({
    required this.user,
    required this.message,
    required this.date,
    required this.time,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.grey[200]
            : Colors.grey[800],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 20,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.grey
                            : Colors.grey[400],
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.grey
                            : Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
