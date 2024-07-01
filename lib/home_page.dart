import 'package:flutter/material.dart';
import 'package:flexible_scrollbar/flexible_scrollbar.dart';
import 'template.dart';
import 'notification.dart';
import 'user_page.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light, 
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,//darkmode
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final PageController _pageController;
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Explore Southern Cities',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        actions: [
          Switch(
            value: isDarkMode,
            onChanged: (value) {
              setState(() {
                isDarkMode = value;
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: FlexibleScrollbar(
                  controller: _pageController,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: PageView.builder(
                      controller: _pageController,
                      scrollDirection: Axis.vertical,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return buildCarouselItem(context, index);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: NavigationPanel(),
          ),
        ],
      ),
    );
  }

  Widget buildCarouselItem(BuildContext context, int index) {
    final List<String> _carouselImages = [
      "assets/images/fort.jpg",
      "assets/images/bg1.jpg",
      "assets/images/bg3.jpg",
    ];

    final List<String> _carouselTexts = [
      'Discover the enchanting wonders of Galle City!',
      'Explore the Beauty in Matara',
      'Start an amazing journey to Hambantota',
    ];

    final List<String> _buttonLabels = [
      'Visit',
      'Visit',
      'Visit',
    ];

    return Stack(
      children: [
        Image.asset(
          _carouselImages[index],
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _carouselTexts[index],
                  style: TextStyle(
                    fontSize: 24,
                    color: isDarkMode ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Handle button press
                    switch (index) {
                      case 0:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Template1(),
                          ),
                        );
                        break;
                      case 1:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Template2(),
                          ),
                        );
                        break;
                      case 2:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Template3(),
                          ),
                        );
                        break;
                    }
                  },
                  child: Text(_buttonLabels[index]),
                ),
                SizedBox(height: 20), // Adjust the spacing as needed
                GestureDetector(
                  onTap: () {
                  
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 90,
                        color: Colors.white,
                      ),
                   
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Template1 extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _Template1State createState() => _Template1State();
}

class _Template1State extends State<Template1> {
  bool _navigated = false;

  @override
  void initState() {
    super.initState();
    // Navigate to Template screen when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_navigated) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Template()),
        );
        _navigated = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Template 1'),
      ),
      // ignore: prefer_const_constructors
      body: Center(
        child: Text('Navigating to Template...'),
      ),
    );
  }
}

class Template2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Template 2'),
      ),
      body: Center(
        child: Text('This is Template 2'),
      ),
    );
  }
}

class Template3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Template 3'),
      ),
      body: Center(
        child: Text('This is Template 3'),
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
         
            },
            icon: Icon(Icons.home),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
            
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
