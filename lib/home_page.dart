import 'package:flutter/material.dart';
import 'package:new_app/profile_page.dart';
import 'report_page.dart';
import 'activity_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.red,
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 25), // Add top margin here
                          child: const Text(
                            'Hi Juan! Welcome to',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5), // Add spacing between text and image
                        Container(
                          alignment: Alignment.centerLeft, // Align image to the left
                          child: const Image(
                            image: AssetImage('assets/text.png'), // Update the path to your image
                            height: 40, // Adjust the height as needed
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Image.asset(
                        'assets/bg.png',
                        height: 700,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 20,
                        left: MediaQuery.of(context).size.width / 2 - 150, // Center horizontally
                        child: const SizedBox(
                          width: 300,
                          height: 150,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white70,
                            ),
                            child: Center(
                              child: Text('Content Box 1'),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 190,
                        left: MediaQuery.of(context).size.width / 2 - 150, // Center horizontally
                        child: const SizedBox(
                          width: 300,
                          height: 150,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white70,
                            ),
                            child: Center(
                              child: Text('Content Box 2'),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 360,
                        left: MediaQuery.of(context).size.width / 2 - 150, // Center horizontally
                        child: const SizedBox(
                          width: 300,
                          height: 150,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white70,
                            ),
                            child: Center(
                              child: Text('Content Box 3'),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 530,
                        left: MediaQuery.of(context).size.width / 2 - 150, // Center horizontally
                        child: const SizedBox(
                          width: 300,
                          height: 150,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white70,
                            ),
                            child: Center(
                              child: Text('Content Box 4'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ReportPage(),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ActivityPage(),
              ),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            );
          }
        },
      ),
    );
  }
}
