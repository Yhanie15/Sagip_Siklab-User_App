import 'package:flutter/material.dart';
import 'home_page.dart'; // Import HomePage for navigation
import 'report_page.dart'; // Import ReportPage for navigation
import 'profile_page.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Sample data for reports
    final reports = [
      {'title': 'Fire at Main Street', 'status': 'Resolved', 'date': '2024-08-15', 'description': 'A fire reported at Main Street was resolved by the fire department.'},
      {'title': 'Electrical Issue at Elm Street', 'status': 'In Progress', 'date': '2024-08-13', 'description': 'Electrical issues reported at Elm Street. Fire department is currently investigating.'},
      {'title': 'Fireworks Accident at High School', 'status': 'Resolved', 'date': '2024-08-12', 'description': 'An accident due to fireworks was reported at the high school. Situation is under control.'},
    ];

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Activity Reports',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0), // Custom height for the TabBar
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.white, // Text color for selected tab
            unselectedLabelColor: const Color.fromARGB(255, 255, 249, 249), // Text color for unselected tabs
            indicator: BoxDecoration(
              color: Colors.red, // Background color for selected tab
              borderRadius: BorderRadius.circular(5),
            ),
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                alignment: Alignment.center,
                child: const Tab(text: 'Ongoing'),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                alignment: Alignment.center,
                child: const Tab(text: 'Completed'),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildReportList(reports.where((report) => report['status'] != 'Resolved').toList()),
          _buildReportList(reports.where((report) => report['status'] == 'Resolved').toList()),
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
        currentIndex: 2, // Set the current index to the Activity tab
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ReportPage(),
              ),
            );
          }
          else if (index == 3) {
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

  Widget _buildReportList(List<Map<String, String>> reports) {
    if (reports.isEmpty) {
      return const Center(
        child: Text('No report yet.'),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: reports.length,
      itemBuilder: (context, index) {
        final report = reports[index];
        return Card(
          elevation: 5,
          margin: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  report['title']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Status: ${report['status']}',
                  style: TextStyle(
                    fontSize: 16,
                    color: _getStatusColor(report['status']!),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Date: ${report['date']}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  report['description']!,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Resolved':
        return Colors.green;
      case 'Pending':
        return Colors.orange;
      case 'In Progress':
        return Colors.blue;
      default:
        return Colors.black;
    }
  }
}
